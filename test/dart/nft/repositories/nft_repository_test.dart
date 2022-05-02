import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web3dart/contracts.dart';

import 'nft_repository_test.mocks.dart';

@GenerateMocks([NFTDataSource, DeployedContract, EventParams])
void main() {
  late NFTRepositoryImpl repository;
  late MockNFTDataSource mockNFTDataSource;
  late MockDeployedContract mockDeployedContract;
  late MockEventParams mockEventParams;

  setUp(() {
    mockNFTDataSource = MockNFTDataSource();
    mockDeployedContract = MockDeployedContract();
    mockEventParams = MockEventParams();
    repository = NFTRepositoryImpl(
      dataSource: mockNFTDataSource,
    );
  });

  group('getName', () {
    test('should return name = "Token Name"', () async {
      when(mockNFTDataSource.getName()).thenAnswer((_) async => 'Token Name');

      final result = await repository.getName();

      verify(mockNFTDataSource.getName());
      expect((result as Right).value, 'Token Name');
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.getName()).thenThrow(Exception());

      final result = await repository.getName();

      verify(mockNFTDataSource.getName());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getSymbol', () {
    test('should return symbol = "FNM"', () async {
      when(mockNFTDataSource.getSymbol()).thenAnswer((_) async => 'FNM');

      final result = await repository.getSymbol();

      verify(mockNFTDataSource.getSymbol());
      expect((result as Right).value, 'FNM');
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.getSymbol()).thenThrow(Exception());

      final result = await repository.getSymbol();

      verify(mockNFTDataSource.getSymbol());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getTokenCounter', () {
    test('should return token counter = 1000', () async {
      when(mockNFTDataSource.getTokenCounter()).thenAnswer((_) async => 1000);

      final result = await repository.getTokenCounter();

      verify(mockNFTDataSource.getTokenCounter());
      expect((result as Right).value, 1000);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.getTokenCounter()).thenThrow(Exception());

      final result = await repository.getTokenCounter();

      verify(mockNFTDataSource.getTokenCounter());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getContract', () {
    test('should return contract', () async {
      when(mockNFTDataSource.getContract()).thenAnswer(
        (_) async => mockDeployedContract,
      );

      final result = await repository.getContract();

      verify(mockNFTDataSource.getContract());
      expect((result as Right).value, mockDeployedContract);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.getContract()).thenThrow(Exception());

      final result = await repository.getContract();

      verify(mockNFTDataSource.getContract());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('mint', () {
    test('should return true', () async {
      when(mockNFTDataSource.mint(
        contract: anyNamed('contract'),
        tokenURI: anyNamed('tokenURI'),
        address: anyNamed('address'),
      )).thenAnswer((_) async => unit);

      final result = await repository.mint(
        contract: mockDeployedContract,
        tokenURI: 'https://images/test.png',
        address: '0x0000000000000000000000000000000000000000',
      );

      verify(mockNFTDataSource.mint(
        contract: anyNamed('contract'),
        tokenURI: anyNamed('tokenURI'),
        address: anyNamed('address'),
      ));
      expect((result as Right).value, true);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.mint(
        contract: anyNamed('contract'),
        tokenURI: anyNamed('tokenURI'),
        address: anyNamed('address'),
      )).thenThrow(Exception());

      final result = await repository.mint(
        contract: mockDeployedContract,
        tokenURI: 'https://images/test.png',
        address: '0x0000000000000000000000000000000000000000',
      );

      verify(mockNFTDataSource.mint(
        contract: anyNamed('contract'),
        tokenURI: anyNamed('tokenURI'),
        address: anyNamed('address'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getImageURL', () {
    test('should return image URL = "https://images/test.png"', () async {
      when(mockNFTDataSource.getImageUrl(
        contract: anyNamed('contract'),
        tokenCounter: anyNamed('tokenCounter'),
      )).thenAnswer((_) async => 'https://images/test.png');

      final result = await repository.getImageURL(
        contract: mockDeployedContract,
        tokenCounter: 0,
      );

      verify(mockNFTDataSource.getImageUrl(
        contract: anyNamed('contract'),
        tokenCounter: anyNamed('tokenCounter'),
      ));
      expect((result as Right).value, 'https://images/test.png');
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.getImageUrl(
        contract: anyNamed('contract'),
        tokenCounter: anyNamed('tokenCounter'),
      )).thenThrow(Exception());

      final result = await repository.getImageURL(
        contract: mockDeployedContract,
        tokenCounter: 0,
      );

      verify(mockNFTDataSource.getImageUrl(
        contract: anyNamed('contract'),
        tokenCounter: anyNamed('tokenCounter'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('mintEvent', () {
    test('should return eventParams', () async {
      when(mockNFTDataSource.mintEvent(
        contract: anyNamed('contract'),
      )).thenAnswer((_) async => mockEventParams);

      final result = await repository.mintEvent(contract: mockDeployedContract);

      verify(mockNFTDataSource.mintEvent(contract: anyNamed('contract')));
      expect((result as Right).value, mockEventParams);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockNFTDataSource.mintEvent(
        contract: anyNamed('contract'),
      )).thenThrow(Exception());

      final result = await repository.mintEvent(contract: mockDeployedContract);

      verify(mockNFTDataSource.mintEvent(contract: anyNamed('contract')));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });
}
