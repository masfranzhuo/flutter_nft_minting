import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/counter/data_sources/counter_data_source.dart';
import 'package:flutter_smart_contract_counter/counter/repositories/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_repository_test.mocks.dart';

@GenerateMocks([CounterDataSource])
void main() {
  late CounterRepositoryImpl repository;
  late MockCounterDataSource mockCounterDataSource;

  setUp(() {
    mockCounterDataSource = MockCounterDataSource();
    repository = CounterRepositoryImpl(
      dataSource: mockCounterDataSource,
    );
  });

  group('getCounter', () {
    test('should return counter value = 1', () async {
      when(mockCounterDataSource.getCounter()).thenAnswer((_) async => 1);

      final result = await repository.getCounter();

      verify(mockCounterDataSource.getCounter());
      expect((result as Right).value, 1);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockCounterDataSource.getCounter()).thenThrow(Exception());

      final result = await repository.getCounter();

      verify(mockCounterDataSource.getCounter());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('incrementCounter', () {
    test('should call incrementCounter()', () async {
      when(mockCounterDataSource.incrementCounter()).thenAnswer(
        (_) async => 1,
      );

      await repository.incrementCounter();

      verify(mockCounterDataSource.incrementCounter());
    });

    test('should return UnexpectedFailure()', () async {
      when(mockCounterDataSource.incrementCounter())
          .thenThrow(Exception());

      final result = await repository.incrementCounter();

      verify(mockCounterDataSource.incrementCounter());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });
}
