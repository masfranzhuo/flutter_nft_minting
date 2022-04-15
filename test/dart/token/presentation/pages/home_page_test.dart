import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/my_app.dart';
import 'package:flutter_token/token/entities/token.dart';
import 'package:flutter_token/token/state_managers/token_cubit/token_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities/entity_helpers.dart';

class MockTokenCubit extends MockCubit<TokenState> implements TokenCubit {}

class FakeTokenState extends Fake implements TokenState {}

void main() {
  late MockTokenCubit mockTokenCubit;
  late Token token;

  setUpAll(() {
    registerFallbackValue(FakeTokenState());
  });

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockTokenCubit = MockTokenCubit();
    token = Token(name: 'Token Name', symbol: 'TN', totalSupply: 1000);

    GetIt.I.registerLazySingleton<TokenCubit>(() => mockTokenCubit);
  });

  tearDown(() async {
    mockTokenCubit.close();
    await GetIt.I.reset();
  });

  testWidgets(
      'should find text = "Token details:", 3 other text widgets with token value and 5 elevated button',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState(token: token));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Token details:'), findsOneWidget);
    expect(find.text(token.name), findsOneWidget);
    expect(find.text(token.symbol), findsOneWidget);
    expect(find.text(token.totalSupply.toString()), findsOneWidget);

    expect(find.byType(ElevatedButton), findsNWidgets(5));
  });

  testWidgets(
      'should find CircularProgressIndicator() widget when isLoading is true',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState(isLoading: true));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should find SizedBox widget when no token staked',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets(
      'should find Column with stake amount widget when has token staked',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState(
      stakingSummary: stakingSummaryFixture,
    ));

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(
      find.byWidgetPredicate(
        (w) =>
            w is Column &&
            w.children[0] is Row &&
            (w.children[0] as Row).children[0] is Text &&
            ((w.children[0] as Row).children[0] as Text).data ==
                '1. Stake Amount: ${stakingSummaryFixture.stakes[0].amount} at ${stakingSummaryFixture.stakes[0].since}' &&
            (w.children[0] as Row).children[1] is TextButton &&
            ((w.children[0] as Row).children[1] as TextButton).child is Text &&
            (((w.children[0] as Row).children[1] as TextButton).child as Text)
                    .data ==
                'Unstake',
      ),
      findsOneWidget,
    );
  });

  testWidgets('should tap mint button and call mint()',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(),
        TokenState(token: token),
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

    verify(() => mockTokenCubit.mint(amount: any(named: 'amount')));
  });

  testWidgets('should tap burn button and call burn()',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(),
        TokenState(token: token),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    final button = find.byWidgetPredicate(
      (w) =>
          w is ElevatedButton &&
          w.child is Text &&
          (w.child as Text).data == 'Burn',
    );
    await tester.tap(button);
    await tester.pump();

    verify(() => mockTokenCubit.burn(amount: any(named: 'amount')));
  });

  testWidgets('should tap transfer button and call transfer()',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(),
        TokenState(token: token),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    final button = find.byWidgetPredicate(
      (w) =>
          w is ElevatedButton &&
          w.child is Text &&
          (w.child as Text).data == 'Transfer',
    );
    await tester.tap(button);
    await tester.pump();

    verify(
      () => mockTokenCubit.transfer(
        amount: any(named: 'amount'),
        addressHexString: any(named: 'addressHexString'),
      ),
    );
  });

  testWidgets('should tap stake button and call stakeToken()',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(),
        TokenState(token: token),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    final button = find.byWidgetPredicate(
      (w) =>
          w is ElevatedButton &&
          w.child is Text &&
          (w.child as Text).data == 'Stake',
    );
    await tester.tap(button);
    await tester.pump();

    verify(() => mockTokenCubit.stakeToken(amount: any(named: 'amount')));
  });

  testWidgets('should tap refresh button', (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState());
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(),
        TokenState(token: token),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    final button = find.byWidgetPredicate(
      (w) =>
          w is ElevatedButton &&
          w.child is Text &&
          (w.child as Text).data == 'Refresh',
    );
    await tester.tap(button);
    await tester.pump();
  });

  testWidgets('should tap unstake button and call withdrawStake()',
      (WidgetTester tester) async {
    when(() => mockTokenCubit.state).thenReturn(TokenState(
      stakingSummary: stakingSummaryFixture,
    ));
    whenListen(
      mockTokenCubit,
      Stream.fromIterable([
        TokenState(stakingSummary: stakingSummaryFixture),
        TokenState(stakingSummary: stakingSummaryFixture),
      ]),
    );

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('key-unstake-0')));
    await tester.pump();

    verify(
      () => mockTokenCubit.withdrawStake(
        amount: any(named: 'amount'),
        index: any(named: 'index'),
      ),
    );
  });
}
