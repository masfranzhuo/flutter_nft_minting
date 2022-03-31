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
}
