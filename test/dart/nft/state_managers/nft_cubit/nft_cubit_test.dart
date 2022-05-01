import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/nft/state_managers/nft_cubit/nft_cubit.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_image_url.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';

import 'nft_cubit_test.mocks.dart';

@GenerateMocks([
  GetName,
  GetSymbol,
  GetTokenCounter,
  GetContract,
  Mint,
  GetImageURL,
  DeployedContract,
])
void main() {
  late NFTCubit cubit;
  late MockGetName mockGetName;
  late MockGetSymbol mockGetSymbol;
  late MockGetTokenCounter mockGetTokenCounter;
  late MockGetContract mockGetContract;
  late MockMint mockMint;
  late MockGetImageURL mockGetImageURL;
  late MockDeployedContract mockDeployedContract;

  setUp(() {
    mockGetName = MockGetName();
    mockGetSymbol = MockGetSymbol();
    mockGetTokenCounter = MockGetTokenCounter();
    mockMint = MockMint();
    mockGetImageURL = MockGetImageURL();
    mockDeployedContract = MockDeployedContract();
    mockGetContract = MockGetContract();
    cubit = NFTCubit(
      getName: mockGetName,
      getSymbol: mockGetSymbol,
      getTokenCounter: mockGetTokenCounter,
      getContract: mockGetContract,
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

  group('getContract', () {
    blocTest(
      'should emit failure',
      build: () {
        when(mockGetContract(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.getContract(),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(
          isLoading: false,
          failure: const UnexpectedFailure(),
        ),
      ],
      verify: (_) async {
        verify(mockGetContract(any));
      },
    );
    blocTest(
      'should emit contract',
      build: () {
        when(mockGetContract(any)).thenAnswer(
          (_) async => Right(mockDeployedContract),
        );

        return cubit;
      },
      act: (_) async => cubit.getContract(),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(isLoading: false, contract: mockDeployedContract),
      ],
      verify: (_) async {
        verify(mockGetContract(any));
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

        return cubit;
      },
      act: (_) async => cubit.mint(
        contract: mockDeployedContract,
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      ),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(
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

        return cubit;
      },
      act: (_) async => cubit.mint(
        contract: mockDeployedContract,
        tokenCounter: 0,
        address: '0x0000000000000000000000000000000000000000',
      ),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(isLoading: false),
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

        return cubit;
      },
      act: (_) async => cubit.getImageURL(
        contract: mockDeployedContract,
        tokenCounter: 0,
      ),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(
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

        return cubit;
      },
      act: (_) async => cubit.getImageURL(
        contract: mockDeployedContract,
        tokenCounter: 0,
      ),
      expect: () => [
        NFTState(isLoading: true),
        NFTState(isLoading: false, imageURL: 'https://images/test.png'),
      ],
      verify: (_) async {
        verify(mockGetImageURL(any));
      },
    );
  });
}
