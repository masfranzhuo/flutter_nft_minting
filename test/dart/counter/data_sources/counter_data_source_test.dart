import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_smart_contract_counter/counter/data_sources/counter_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_data_source_test.mocks.dart';

@GenerateMocks([SmartContractWeb3Client])
void main() {
  late CounterDataSourceImpl dataSource;
  late MockSmartContractWeb3Client mockClient;

  setUp(() {
    mockClient = MockSmartContractWeb3Client();
    dataSource = CounterDataSourceImpl(client: mockClient);
  });

  group('getCounter', () {
    test('should return counter value = 1', () async {
      when(mockClient.callContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 1);

      final result = await dataSource.getCounter();

      verify(mockClient.callContract(
        contractName: 'Counter',
        contractFileLocation: 'src/artifacts/Counter.json',
        functionName: 'counter',
      ));
      expect(result, 1);
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.callContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getCounter(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });

  group('incrementCounter', () {
    test('should call sendTransaction()', () async {
      when(mockClient.sendTransaction(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 1);

      await dataSource.incrementCounter();

      verify(mockClient.sendTransaction(
        contractName: 'Counter',
        contractFileLocation: 'src/artifacts/Counter.json',
        functionName: 'incrementCounter',
      ));
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.sendTransaction(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => dataSource.incrementCounter(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });
}
