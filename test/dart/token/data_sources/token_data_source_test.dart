import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_token/token/data_sources/token_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/web3dart.dart';

import 'token_data_source_test.mocks.dart';

@GenerateMocks([SmartContractWeb3Client, DeployedContract])
void main() {
  late TokenDataSourceImpl dataSource;
  late MockSmartContractWeb3Client mockClient;
  late MockDeployedContract mockDeployedContract;

  setUp(() {
    mockClient = MockSmartContractWeb3Client();
    mockDeployedContract = MockDeployedContract();
    dataSource = TokenDataSourceImpl(client: mockClient);
  });

  group('mint', () {
    test('should call mint()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => true);

      await dataSource.mint();

      verify(mockClient.sendTransaction(
        contract: mockDeployedContract,
        functionName: 'mint',
      ));
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.mint(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });

  group('burn', () {
    test('should call burn()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => true);

      await dataSource.burn();

      verify(mockClient.sendTransaction(
        contract: mockDeployedContract,
        functionName: 'burn',
      ));
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => dataSource.burn(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });
}
