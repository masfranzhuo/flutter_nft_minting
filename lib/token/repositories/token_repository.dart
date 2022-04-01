import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/token/data_sources/token_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class TokenRepository {
  Future<Either<Failure, Unit>> mint({required int amount});
  Future<Either<Failure, Unit>> burn({required int amount});
  Future<Either<Failure, String>> getName();
  Future<Either<Failure, String>> getSymbol();
  Future<Either<Failure, int>> getTotalSupply();
}

@LazySingleton(as: TokenRepository)
class TokenRepositoryImpl extends TokenRepository {
  final TokenDataSource dataSource;

  TokenRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, Unit>> burn({required int amount}) async {
    try {
      await dataSource.burn(amount: amount);

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> mint({required int amount}) async {
    try {
      await dataSource.mint(amount: amount);

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
}
