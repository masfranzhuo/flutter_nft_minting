import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_repository_test.mocks.dart';

@GenerateMocks([NFTDataSource])
void main() {
  late NFTRepositoryImpl repository;
  late MockNFTDataSource mockNFTDataSource;

  setUp(() {
    mockNFTDataSource = MockNFTDataSource();
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
}
