import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/counter/state_managers/counter_cubit/counter_cubit.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/get_counter.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/increment_counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_cubit_test.mocks.dart';

@GenerateMocks([GetCounter, IncrementCounter])
void main() {
  late CounterCubit cubit;
  late MockGetCounter mockGetCounter;
  late MockIncrementCounter mockIncrementCounter;

  setUp(() {
    mockGetCounter = MockGetCounter();
    mockIncrementCounter = MockIncrementCounter();
    cubit = CounterCubit(
      getCounter: mockGetCounter,
      incrementCounter: mockIncrementCounter,
    );
  });

  group('get', () {
    blocTest(
      'should emit counter [0,1]',
      build: () {
        when(mockGetCounter(any)).thenAnswer(
          (_) async => const Right(1),
        );

        return cubit;
      },
      act: (_) async => cubit.get(),
      expect: () => [
        CounterState(isLoading: true, counter: 0),
        CounterState(isLoading: false, counter: 1),
      ],
      verify: (_) async {
        verify(mockGetCounter(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockGetCounter(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.get(),
      expect: () => [
        CounterState(isLoading: true, counter: 0),
        CounterState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockGetCounter(any));
      },
    );
  });

  group('increment', () {
    blocTest(
      'should emit counter and call increment()',
      build: () {
        when(mockIncrementCounter(any)).thenAnswer(
          (_) async => const Right(unit),
        );

        return cubit;
      },
      act: (_) async => cubit.increment(),
      expect: () => [
        CounterState(isLoading: true, counter: 0),
        CounterState(isLoading: false),
      ],
      verify: (_) async {
        verify(mockIncrementCounter(any));
      },
    );
    blocTest(
      'should emit failure',
      build: () {
        when(mockIncrementCounter(any)).thenAnswer(
          (_) async => const Left(UnexpectedFailure()),
        );

        return cubit;
      },
      act: (_) async => cubit.increment(),
      expect: () => [
        CounterState(isLoading: true, counter: 0),
        CounterState(isLoading: false, failure: const UnexpectedFailure()),
      ],
      verify: (_) async {
        verify(mockIncrementCounter(any));
      },
    );
  });
}
