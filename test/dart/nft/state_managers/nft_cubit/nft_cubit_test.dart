import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_cubit/nft_cubit.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_cubit_test.mocks.dart';

@GenerateMocks([GetName, GetSymbol, GetTokenCounter, Mint])
void main() {
  late NFTCubit cubit;
  late MockGetName mockGetName;
  late MockGetSymbol mockGetSymbol;
  late MockGetTokenCounter mockGetTokenCounter;
  late MockMint mockMint;

  setUp(() {
    mockGetName = MockGetName();
    mockGetSymbol = MockGetSymbol();
    mockGetTokenCounter = MockGetTokenCounter();
    mockMint = MockMint();
    cubit = NFTCubit(
      getName: mockGetName,
      getSymbol: mockGetSymbol,
      getTokenCounter: mockGetTokenCounter,
      mint: mockMint,
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

        return cubit;
      },
      act: (_) async => cubit.get(),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(
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
      'should emit imageUrl = "https://images/test.png"',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Right('https://images/test.png'),
        );

        return cubit;
      },
      act: (_) async => cubit.mint(
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      ),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(
          isLoading: false,
          imageUrl: 'https://images/test.png',
        ),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
  });
}
