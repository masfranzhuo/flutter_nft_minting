import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/token/data_sources/token_data_source.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../entities/entity_helpers.dart';
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
      when(mockTokenDataSource.mint(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      )).thenAnswer((_) async => unit);

      await repository.mint(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.mint(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      ));
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.mint(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      )).thenThrow(Exception());

      final result = await repository.mint(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.mint(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('burn', () {
    test('should call burn()', () async {
      when(mockTokenDataSource.burn(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      )).thenAnswer((_) async => unit);

      await repository.burn(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.burn(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      ));
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.burn(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      )).thenThrow(Exception());

      final result = await repository.burn(
        amount: 1000,
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.burn(
        amount: anyNamed('amount'),
        address: anyNamed('address'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('transfer', () {
    test('should call transfer()', () async {
      when(mockTokenDataSource.transfer(
        amount: anyNamed('amount'),
        addressHexString: anyNamed('addressHexString'),
      )).thenAnswer(
        (_) async => unit,
      );

      await repository.transfer(
        amount: 1000,
        addressHexString: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.transfer(
        amount: anyNamed('amount'),
        addressHexString: anyNamed('addressHexString'),
      ));
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.transfer(
        amount: anyNamed('amount'),
        addressHexString: anyNamed('addressHexString'),
      )).thenThrow(Exception());

      final result = await repository.transfer(
        amount: 1000,
        addressHexString: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.transfer(
        amount: anyNamed('amount'),
        addressHexString: anyNamed('addressHexString'),
      ));
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

  group('getStakingSummary', () {
    test('should return staking summary', () async {
      when(mockTokenDataSource.getStakingSummary(
        address: anyNamed('address'),
      )).thenAnswer((_) async => stakingSummaryFixture);

      final result = await repository.getStakingSummary(
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.getStakingSummary(
        address: anyNamed('address'),
      ));
      expect((result as Right).value, stakingSummaryFixture);
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.getStakingSummary(
        address: anyNamed('address'),
      )).thenThrow(Exception());

      final result = await repository.getStakingSummary(
        address: '0x47E2935e04CdA3bAFD7e399244d430914939D544',
      );

      verify(mockTokenDataSource.getStakingSummary(
        address: anyNamed('address'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('stakeToken', () {
    test('should call stakeToken()', () async {
      when(mockTokenDataSource.stakeToken(
        amount: anyNamed('amount'),
      )).thenAnswer((_) async => unit);

      await repository.stakeToken(amount: 1000);

      verify(mockTokenDataSource.stakeToken(amount: anyNamed('amount')));
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.stakeToken(
        amount: anyNamed('amount'),
      )).thenThrow(Exception());

      final result = await repository.stakeToken(amount: 1000);

      verify(mockTokenDataSource.stakeToken(amount: anyNamed('amount')));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });

  group('withdrawStake', () {
    test('should call withdrawStake()', () async {
      when(mockTokenDataSource.withdrawStake(
        amount: anyNamed('amount'),
        index: anyNamed('index'),
      )).thenAnswer((_) async => unit);

      await repository.withdrawStake(amount: 1000, index: 0);

      verify(mockTokenDataSource.withdrawStake(
        amount: anyNamed('amount'),
        index: anyNamed('index'),
      ));
    });

    test('should return UnexpectedFailure()', () async {
      when(mockTokenDataSource.withdrawStake(
        amount: anyNamed('amount'),
        index: anyNamed('index'),
      )).thenThrow(Exception());

      final result = await repository.withdrawStake(amount: 1000, index: 0);

      verify(mockTokenDataSource.withdrawStake(
        amount: anyNamed('amount'),
        index: anyNamed('index'),
      ));
      expect((result as Left).value, isA<UnexpectedFailure>());
    });
  });
}
