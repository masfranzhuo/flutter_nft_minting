import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';
import 'package:mockito/annotations.dart';

import 'nft_data_source_test.mocks.dart';

@GenerateMocks([SmartContractWeb3Client, DeployedContract])
void main() {
  late NFTDataSourceImpl dataSource;
  late MockSmartContractWeb3Client mockClient;
  late MockDeployedContract mockDeployedContract;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: '''
      CONTRACT_ADDRESS = 0x86e506A36F9E0789c997835783B37C504946724C
      ALCHEMY_KEY_TEST=ALCHEMY_KEY_TEST
      WALLET_PRIVATE_KEY=67f72b3f3eec31c718be95e2f53a883cbc63b5f2baf9427cb0ee84e020f65d1e
    ''');

    mockClient = MockSmartContractWeb3Client();
    mockDeployedContract = MockDeployedContract();
    dataSource = NFTDataSourceImpl(client: mockClient);
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
    test('should return symbol = "FNM"', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 'FNM');

      final result = await dataSource.getSymbol();

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'symbol',
      ));
      expect(result, 'FNM');
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

  group('getTokenCounter', () {
    test('should return token counter = 0', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
      )).thenAnswer((_) async => 0);

      final result = await dataSource.getTokenCounter();

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'tokenCounter',
      ));
      expect(result, 0);
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
        () async => await dataSource.getTokenCounter(),
        throwsA(isA<UnexpectedFailure>()),
      );
    });
  });
}
