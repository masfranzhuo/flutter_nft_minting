import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/token/data_sources/token_data_source.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'token_repository_test.mocks.dart';

@GenerateMocks([TokenDataSource])
void main() {
  late TokenRepositoryImpl repository;
  late MockTokenDataSource mockTokenDataSource;

  setUp(() {
    mockTokenDataSource = MockTokenDataSource();
    repository = TokenRepositoryImpl(
      dataSource: mockTokenDataSource,
    );
  });

  group('mint', () {
    test('should call mint()', () async {
      when(mockTokenDataSource.mint()).thenAnswer((_) async => 1);

      await repository.mint();

      verify(mockTokenDataSource.mint());
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.mint()).thenThrow(Exception());

      final result = await repository.mint();

      verify(mockTokenDataSource.mint());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('burn', () {
    test('should call burn()', () async {
      when(mockTokenDataSource.burn()).thenAnswer(
        (_) async => 1,
      );

      await repository.burn();

      verify(mockTokenDataSource.burn());
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.burn()).thenThrow(Exception());

      final result = await repository.burn();

      verify(mockTokenDataSource.burn());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getName', () {
    test('should return name = "Token Name"', () async {
      when(mockTokenDataSource.getName()).thenAnswer((_) async => 'Token Name');

      final result = await repository.getName();

      verify(mockTokenDataSource.getName());
      expect((result as Right).value, 'Token Name');
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.getName()).thenThrow(Exception());

      final result = await repository.getName();

      verify(mockTokenDataSource.getName());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getSymbol', () {
    test('should return symbol = "TN"', () async {
      when(mockTokenDataSource.getSymbol()).thenAnswer((_) async => 'TN');

      final result = await repository.getSymbol();

      verify(mockTokenDataSource.getSymbol());
      expect((result as Right).value, 'TN');
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.getSymbol()).thenThrow(Exception());

      final result = await repository.getSymbol();

      verify(mockTokenDataSource.getSymbol());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('getTotalSupply', () {
    test('should return total supply = 1000', () async {
      when(mockTokenDataSource.getTotalSupply()).thenAnswer((_) async => 1000);

      final result = await repository.getTotalSupply();

      verify(mockTokenDataSource.getTotalSupply());
      expect((result as Right).value, 1000);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.getTotalSupply()).thenThrow(Exception());

      final result = await repository.getTotalSupply();

      verify(mockTokenDataSource.getTotalSupply());
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });
}
