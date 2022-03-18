import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/use_case.dart';
import 'package:flutter_smart_contract_counter/counter/repositories/counter_repository.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/increment_counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'increment_counter_test.mocks.dart';

@GenerateMocks([CounterRepository])
void main() {
  late IncrementCounter incrementCounter;
  late MockCounterRepository mockCounterRepository;

  setUp(() {
    mockCounterRepository = MockCounterRepository();
    incrementCounter =
        IncrementCounter(repository: mockCounterRepository);
  });

  test('should call incrementCounter()', () async {
    when(mockCounterRepository.incrementCounter()).thenAnswer(
      (_) async => const Right(unit),
    );

    await incrementCounter(NoParams());

    verify(mockCounterRepository.incrementCounter());
  });
}
