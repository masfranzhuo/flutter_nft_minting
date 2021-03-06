import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/my_app.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_bloc/nft_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web3dart/contracts.dart';

class MockNftBloc extends MockBloc<NftEvent, NftState> implements NftBloc {}

class FakeNftState extends Fake implements NftState {}

class FakeNftEvent extends Fake implements NftEvent {}

class MockDeployedContract extends Mock implements DeployedContract {}

void main() {
  late MockNftBloc mockNftBloc;
  late MockDeployedContract mockDeployedContract;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeNftState());
    registerFallbackValue(FakeNftEvent());
  });

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: '''
      CONTRACT_ADDRESS = 0x86e506A36F9E0789c997835783B37C504946724C
      JSON_CID = JSON_CID
      IMAGES_CID = IMAGES_CID
    ''');

    mockNftBloc = MockNftBloc();
    mockDeployedContract = MockDeployedContract();

    GetIt.I.registerLazySingleton<NftBloc>(() => mockNftBloc);
  });

  tearDown(() async {
    mockNftBloc.close();
    await GetIt.I.reset();
  });

  testWidgets(
      'should find text Contract Address, Name, Symbol, Number of NFT and 1 Elevated Button',
      (WidgetTester tester) async {
    when(() => mockNftBloc.state).thenReturn(NftState(
      isLoading: false,
      name: 'NFT Name',
      symbol: 'FNM',
      tokenCounter: 0,
    ));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(
        find.text(
          'Contract Address: 0x86e506A36F9E0789c997835783B37C504946724C',
        ),
        findsOneWidget);
    expect(find.text('Name: NFT Name'), findsOneWidget);
    expect(find.text('Symbol: FNM'), findsOneWidget);
    expect(find.text('Number of NFT: 0'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      'should find CircularProgressIndicator() widget when isLoading is true',
      (WidgetTester tester) async {
    when(() => mockNftBloc.state).thenReturn(NftState(isLoading: true));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should found text failure message', (WidgetTester tester) async {
    when(() => mockNftBloc.state).thenReturn(NftState(
      failure: const UnexpectedFailure(message: 'error message'),
    ));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('error message'), findsOneWidget);
  });

  testWidgets('should load image widget when imageURL exist',
      (WidgetTester tester) async {
    HttpOverrides.runZoned(
      () async {
        when(() => mockNftBloc.state).thenReturn(NftState(
          imageURL: 'https://images/test.png',
        ));

        await tester.pumpWidget(const MyApp());
        await tester.pump();

        expect(find.byType(Image), findsOneWidget);
      },
    );
  });

  testWidgets('should tap mint button and call mint()',
      (WidgetTester tester) async {
    when(() => mockNftBloc.state).thenReturn(NftState(
      contract: mockDeployedContract,
    ));
    whenListen(
      mockNftBloc,
      Stream.fromIterable([
        NftState(),
        NftState(name: 'NFT Name', symbol: 'FNM', tokenCounter: 0),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    final button = find.byWidgetPredicate(
      (w) =>
          w is ElevatedButton &&
          w.child is Text &&
          (w.child as Text).data == 'Mint',
    );
    await tester.tap(button);
    await tester.pump();

    verify(
      () => mockNftBloc.add(NftEvent.mint(
        contract: mockDeployedContract,
        tokenCounter: 0,
        address: '0x1cb728ab78fcf1d8688ddad7fc6aeb2cba96c15f',
      )),
    );
  });
}
