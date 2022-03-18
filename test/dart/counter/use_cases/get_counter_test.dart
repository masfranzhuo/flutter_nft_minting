import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/use_case.dart';
import 'package:flutter_smart_contract_counter/counter/repositories/counter_repository.dart';
import 'package:flutter_smart_contract_counter/counter/use_cases/get_counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_counter_test.mocks.dart';

@GenerateMocks([CounterRepository])
void main() {
  late GetCounter getCounter;
  late MockCounterRepository mockCounterRepository;

  setUp(() {
    mockCounterRepository = MockCounterRepository();
    getCounter = GetCounter(repository: mockCounterRepository);
  });

  test('should return counter value is 1', () async {
    when(mockCounterRepository.getCounter()).thenAnswer(
      (_) async => const Right(1),
    );

    final result = await getCounter(NoParams());

    verify(mockCounterRepository.getCounter());
    expect((result as Right).value, 1);
  });
}
