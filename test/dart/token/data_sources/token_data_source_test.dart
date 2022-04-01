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
        params: anyNamed('params'),
      )).thenAnswer((_) async => true);

      await dataSource.mint(amount: 1000);

      verify(mockClient.sendTransaction(
        contract: mockDeployedContract,
        functionName: 'mint',
        params: anyNamed('params'),
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
        params: anyNamed('params'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.mint(amount: 1000),
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
        params: anyNamed('params'),
      )).thenAnswer((_) async => true);

      await dataSource.burn(amount: 1000);

      verify(mockClient.sendTransaction(
        contract: mockDeployedContract,
        functionName: 'burn',
        params: anyNamed('params'),
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
        params: anyNamed('params'),
      )).thenThrow(Exception());

      expect(
        () async => dataSource.burn(amount: 1000),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });

  group('getName', () {
    test('should return name = "Token Name"', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 'Token Name');

      final result = await dataSource.getName();

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'name',
      ));
      expect(result, 'Token Name');
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getName(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });

  group('getSymbol', () {
    test('should return symbol = "TN"', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 'TN');

      final result = await dataSource.getSymbol();

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'symbol',
      ));
      expect(result, 'TN');
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getSymbol(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });

  group('getTotalSupply', () {
    test('should return total supply = 1', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 1000000000000000000);

      final result = await dataSource.getTotalSupply();

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'totalSupply',
      ));
      expect(result, 1);
    });

    test('should throw UnexpectedFailure()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getTotalSupply(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });
}
