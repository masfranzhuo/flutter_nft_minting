import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/token/state_managers/token_cubit.dart';
import 'package:flutter_token/token/use_cases/burn.dart';
import 'package:flutter_token/token/use_cases/mint.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'token_cubit_test.mocks.dart';

@GenerateMocks([Mint, Burn])
void main() {
  late TokenCubit cubit;
  late MockMint mockMint;
  late MockBurn mockBurn;

  setUp(() {
    mockMint = MockMint();
    mockBurn = MockBurn();
    cubit = TokenCubit(mint: mockMint, burn: mockBurn);
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
      act: (_) async => cubit.mint(),
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
      act: (_) async => cubit.mint(),
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
      act: (_) async => cubit.burn(),
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
      act: (_) async => cubit.burn(),
      expect: () => [
        TokenState(isLoading: true),
        TokenState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockBurn(any));
      },
    );
  });
}
