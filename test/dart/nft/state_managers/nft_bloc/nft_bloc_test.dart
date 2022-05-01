import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_bloc/nft_bloc.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_image_url.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_bloc_test.mocks.dart';

@GenerateMocks([GetName, GetSymbol, GetTokenCounter, Mint, GetImageURL])
void main() {
  late NftBloc bloc;
  late MockGetName mockGetName;
  late MockGetSymbol mockGetSymbol;
  late MockGetTokenCounter mockGetTokenCounter;
  late MockMint mockMint;
  late MockGetImageURL mockGetImageURL;

  setUp(() {
    mockGetName = MockGetName();
    mockGetSymbol = MockGetSymbol();
    mockGetTokenCounter = MockGetTokenCounter();
    mockMint = MockMint();
    mockGetImageURL = MockGetImageURL();
    bloc = NftBloc(
      getName: mockGetName,
      getSymbol: mockGetSymbol,
      getTokenCounter: mockGetTokenCounter,
      mint: mockMint,
      getImageURL: mockGetImageURL,
    );
  });

  group('get', () {
    blocTest(
      'should emit name, symbol and tokenCounter',
      build: () {
        when(mockGetName(any)).thenAnswer(
          (_) async => const Right('Token Name'),
        );
        when(mockGetSymbol(any)).thenAnswer(
          (_) async => const Right('FNM'),
        );
        when(mockGetTokenCounter(any)).thenAnswer(
          (_) async => const Right(1000),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.get()),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          name: 'Token Name',
          symbol: 'FNM',
          tokenCounter: 1000,
        ),
      ],
      verify: (_) async {
        verify(mockGetName(any));
        verify(mockGetSymbol(any));
        verify(mockGetTokenCounter(any));
      },
    );
  });

  group('mint', () {
    blocTest(
      'should emit failure',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.mint(
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      )),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          failure: const UnexpectedFailure(),
        ),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
    blocTest(
      'should emit true',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Right(true),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.mint(
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      )),
      expect: () => [
        NftState(isLoading: true),
        NftState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
  });

  group('getImageURL', () {
    blocTest(
      'should emit failure',
      build: () {
        when(mockGetImageURL(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.getImageUrl(
        tokenCounter: 0,
      )),
      expect: () => [
        NftState(isLoading: true),
        NftState(
          isLoading: false,
          failure: const UnexpectedFailure(),
        ),
      ],
      verify: (_) async {
        verify(mockGetImageURL(any));
      },
    );
    blocTest(
      'should emit imageURL = "https://images/test.png"',
      build: () {
        when(mockGetImageURL(any)).thenAnswer(
          (_) async => const Right('https://images/test.png'),
        );

        return bloc;
      },
      act: (_) async => bloc.add(const NftEvent.getImageUrl(
        tokenCounter: 0,
      )),
      expect: () => [
        NftState(isLoading: true),
        NftState(isLoading: false, imageURL: 'https://images/test.png'),
      ],
      verify: (_) async {
        verify(mockGetImageURL(any));
      },
    );
  });
}
