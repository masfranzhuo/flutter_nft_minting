import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/entities/token.dart';
import 'package:flutter_token/token/state_managers/token_cubit/token_cubit.dart';
import 'package:flutter_token/token/use_cases/burn.dart';
import 'package:flutter_token/token/use_cases/get_name.dart';
import 'package:flutter_token/token/use_cases/get_staking_summary.dart';
import 'package:flutter_token/token/use_cases/get_symbol.dart';
import 'package:flutter_token/token/use_cases/get_total_supply.dart';
import 'package:flutter_token/token/use_cases/mint.dart';
import 'package:flutter_token/token/use_cases/stake_token.dart';
import 'package:flutter_token/token/use_cases/transfer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../entities/entity_helpers.dart';
import 'token_cubit_test.mocks.dart';

@GenerateMocks([
  Mint,
  Burn,
  Transfer,
  GetName,
  GetSymbol,
  GetTotalSupply,
  GetStakingSummary,
  StakeToken,
])
void main() {
  late TokenCubit cubit;
  late MockMint mockMint;
  late MockBurn mockBurn;
  late MockTransfer mockTransfer;
  late MockGetName mockGetName;
  late MockGetSymbol mockGetSymbol;
  late MockGetTotalSupply mockGetTotalSupply;
  late MockGetStakingSummary mockGetStakingSummary;
  late MockStakeToken mockStakeToken;

  setUp(() {
    mockMint = MockMint();
    mockBurn = MockBurn();
    mockTransfer = MockTransfer();
    mockGetName = MockGetName();
    mockGetSymbol = MockGetSymbol();
    mockGetTotalSupply = MockGetTotalSupply();
    mockGetStakingSummary = MockGetStakingSummary();
    mockStakeToken = MockStakeToken();
    cubit = TokenCubit(
      mint: mockMint,
      burn: mockBurn,
      transfer: mockTransfer,
      getName: mockGetName,
      getSymbol: mockGetSymbol,
      getTotalSupply: mockGetTotalSupply,
      getStakingSummary: mockGetStakingSummary,
      stakeToken: mockStakeToken,
    );
  });

  group('mint', () {
    blocTest(
      'should emit isLoading true, then false',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Right(unit),
        );

        return cubit;
      },
      act: (_) async => cubit.mint(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockMint(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.mint(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockMint(any));
      },
    );
  });

  group('burn', () {
    blocTest(
      'should emit isLoading true, then false',
      build: () {
        when(mockBurn(any)).thenAnswer(
          (_) async => const Right(unit),
        );

        return cubit;
      },
      act: (_) async => cubit.burn(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockBurn(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockBurn(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.burn(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockBurn(any));
      },
    );
  });

  group('transfer', () {
    blocTest(
      'should emit isLoading true, then false',
      build: () {
        when(mockTransfer(any)).thenAnswer(
          (_) async => const Right(unit),
        );

        return cubit;
      },
      act: (_) async => cubit.transfer(
        addressHexString: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
        amount: 1000,
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockTransfer(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockTransfer(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.transfer(
        addressHexString: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
        amount: 1000,
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockTransfer(any));
      },
    );
  });

  group('get', () {
    blocTest(
      'should emit token without stakingSummary when no address inputed',
      build: () {
        when(mockGetName(any)).thenAnswer(
          (_) async => const Right('Token Name'),
        );
        when(mockGetSymbol(any)).thenAnswer(
          (_) async => const Right('TN'),
        );
        when(mockGetTotalSupply(any)).thenAnswer(
          (_) async => const Right(1000),
        );

        return cubit;
      },
      act: (_) async => cubit.get(),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(
          isLoading: false,
          token: Token(
            name: 'Token Name',
            symbol: 'TN',
            totalSupply: 1000,
          ),
        ),
      ],
      verify: (_) async {
        verify(mockGetName(any));
        verify(mockGetSymbol(any));
        verify(mockGetTotalSupply(any));
      },
    );
    blocTest(
      'should emit token and stakingSummary',
      build: () {
        when(mockGetName(any)).thenAnswer(
          (_) async => const Right('Token Name'),
        );
        when(mockGetSymbol(any)).thenAnswer(
          (_) async => const Right('TN'),
        );
        when(mockGetTotalSupply(any)).thenAnswer(
          (_) async => const Right(1000),
        );
        when(mockGetStakingSummary(any)).thenAnswer(
          (_) async => Right(stakingSummaryFixture),
        );

        return cubit;
      },
      act: (_) async => cubit.get(
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(
          isLoading: false,
          token: Token(
            name: 'Token Name',
            symbol: 'TN',
            totalSupply: 1000,
          ),
          stakingSummary: stakingSummaryFixture,
        ),
      ],
      verify: (_) async {
        verify(mockGetName(any));
        verify(mockGetSymbol(any));
        verify(mockGetTotalSupply(any));
        verify(mockGetStakingSummary(any));
      },
    );
    blocTest(
      'should emit token and failure when failed to get staking summary',
      build: () {
        when(mockGetName(any)).thenAnswer(
          (_) async => const Right('Token Name'),
        );
        when(mockGetSymbol(any)).thenAnswer(
          (_) async => const Right('TN'),
        );
        when(mockGetTotalSupply(any)).thenAnswer(
          (_) async => const Right(1000),
        );
        when(mockGetStakingSummary(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.get(
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      ),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(
            isLoading: false,
            token: Token(
              name: 'Token Name',
              symbol: 'TN',
              totalSupply: 1000,
            ),
            failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockGetName(any));
        verify(mockGetSymbol(any));
        verify(mockGetTotalSupply(any));
        verify(mockGetStakingSummary(any));
      },
    );
  });

  group('stakeToken', () {
    blocTest(
      'should emit isLoading true, then false',
      build: () {
        when(mockStakeToken(any)).thenAnswer(
          (_) async => const Right(unit),
        );

        return cubit;
      },
      act: (_) async => cubit.stakeToken(amount: 1000),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockStakeToken(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockStakeToken(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.stakeToken(amount: 1000),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockStakeToken(any));
      },
    );
  });
}
