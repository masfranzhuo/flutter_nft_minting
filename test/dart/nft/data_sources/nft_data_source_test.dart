import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';
import 'package:mockito/annotations.dart';

import 'nft_data_source_test.mocks.dart';

@GenerateMocks([SmartContractWeb3Client, DeployedContract, EventParams])
void main() {
  late NFTDataSourceImpl dataSource;
  late MockSmartContractWeb3Client mockClient;
  late MockDeployedContract mockDeployedContract;
  late MockEventParams mockEventParams;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: '''
      CONTRACT_ADDRESS = 0x86e506A36F9E0789c997835783B37C504946724C
      ALCHEMY_KEY_TEST=ALCHEMY_KEY_TEST
      WALLET_PRIVATE_KEY=67f72b3f3eec31c718be95e2f53a883cbc63b5f2baf9427cb0ee84e020f65d1e
    ''');

    mockClient = MockSmartContractWeb3Client();
    mockDeployedContract = MockDeployedContract();
    mockEventParams = MockEventParams();
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

    test('should throw Exception()', () async {
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
        throwsA(isA<Exception>()),
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

    test('should throw Exception()', () async {
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
        throwsA(isA<Exception>()),
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

    test('should throw Exception()', () async {
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
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getContract', () {
    test('should return contract', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenAnswer((_) async => mockDeployedContract);

      final result = await dataSource.getContract();

      verify(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      ));
      expect(result, mockDeployedContract);
    });

    test('should throw Exception()', () async {
      when(mockClient.getContract(
        contractName: anyNamed('contractName'),
        contractFileLocation: anyNamed('contractFileLocation'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getContract(),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('mint', () {
    test('should call mint NFT', () async {
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
        params: anyNamed('params'),
      )).thenAnswer((_) async => unit);

      await dataSource.mint(
        contract: mockDeployedContract,
        tokenURI: 'https://images/test.png',
        address: '0x0000000000000000000000000000000000000000',
      );

      verify(mockClient.sendTransaction(
        contract: mockDeployedContract,
        functionName: 'mint',
        params: anyNamed('params'),
      ));
    });

    test('should throw Exception()', () async {
      when(mockClient.sendTransaction(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
        params: anyNamed('params'),
      )).thenThrow(Exception());

      expect(
        () async => dataSource.mint(
          contract: mockDeployedContract,
          tokenURI: 'https://images/test.png',
          address: '0x0000000000000000000000000000000000000000',
        ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getImageUrl', () {
    test('should return image Url = "https://images/test.png"', () async {
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
        params: anyNamed('params'),
      )).thenAnswer((_) async => 'https://images/test.png');

      final result = await dataSource.getImageUrl(
        contract: mockDeployedContract,
        tokenCounter: 0,
      );

      verify(mockClient.callContract(
        contract: mockDeployedContract,
        functionName: 'tokenURI',
        params: anyNamed('params'),
      ));
      expect(result, 'https://images/test.png');
    });

    test('should throw Exception()', () async {
      when(mockClient.callContract(
        contract: anyNamed('contract'),
        functionName: anyNamed('functionName'),
        params: anyNamed('params'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.getImageUrl(
            contract: mockDeployedContract, tokenCounter: 0),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('mintEvent', () {
    test('should return eventParams', () async {
      when(mockClient.getEvent(
        contract: anyNamed('contract'),
        eventName: anyNamed('eventName'),
      )).thenAnswer((_) async => mockEventParams);

      final result = await dataSource.mintEvent(contract: mockDeployedContract);

      verify(mockClient.getEvent(
        contract: anyNamed('contract'),
        eventName: anyNamed('eventName'),
      ));
      expect(result, mockEventParams);
    });

    test('should throw Exception()', () async {
      when(mockClient.getEvent(
        contract: anyNamed('contract'),
        eventName: anyNamed('eventName'),
      )).thenThrow(Exception());

      expect(
        () async => await dataSource.mintEvent(
          contract: mockDeployedContract,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
