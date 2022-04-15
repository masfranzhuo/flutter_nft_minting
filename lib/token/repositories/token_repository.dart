import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/token/data_sources/token_data_source.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:injectable/injectable.dart';

abstract class TokenRepository {
  Future<Either<Failure, Unit>> mint({required int amount, String? address});
  Future<Either<Failure, Unit>> burn({required int amount, String? address});
  Future<Either<Failure, Unit>> transfer({
    required String addressHexString,
    required int amount,
  });
  Future<Either<Failure, String>> getName();
  Future<Either<Failure, String>> getSymbol();
  Future<Either<Failure, int>> getTotalSupply();
  Future<Either<Failure, Unit>> stakeToken({required int amount});
  Future<Either<Failure, Unit>> withdrawStake({
    required int amount,
    int index = 0,
  });
  Future<Either<Failure, StakingSummary>> getStakingSummary({
    required String address,
  });
}

@LazySingleton(as: TokenRepository)
class TokenRepositoryImpl extends TokenRepository {
  final TokenDataSource dataSource;

  TokenRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Unit>> burn({
    required int amount,
    String? address,
  }) async {
    try {
      await dataSource.burn(amount: amount, address: address);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> mint({
    required int amount,
    String? address,
  }) async {
    try {
      await dataSource.mint(amount: amount, address: address);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> transfer({
    required String addressHexString,
    required int amount,
  }) async {
    try {
      await dataSource.transfer(
        amount: amount,
        addressHexString: addressHexString,
      );

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getName() async {
    try {
      final result = await dataSource.getName();

      return Right(result);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getSymbol() async {
    try {
      final result = await dataSource.getSymbol();

      return Right(result);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTotalSupply() async {
    try {
      final result = await dataSource.getTotalSupply();

      return Right(result);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StakingSummary>> getStakingSummary({
    required String address,
  }) async {
    try {
      final result = await dataSource.getStakingSummary(address: address);

      return Right(result);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> stakeToken({required int amount}) async {
    try {
      await dataSource.stakeToken(amount: amount);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> withdrawStake({
    required int amount,
    int index = 0,
  }) async {
    try {
      await dataSource.withdrawStake(amount: amount, index: index);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
