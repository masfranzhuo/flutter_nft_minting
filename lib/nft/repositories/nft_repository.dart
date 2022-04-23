import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class NFTRepository {
  Future<Either<Failure, String>> getName();
  Future<Either<Failure, String>> getSymbol();
  Future<Either<Failure, int>> getTokenCounter();
}

@LazySingleton(as: NFTRepository)
class NFTRepositoryImpl extends NFTRepository {
  final NFTDataSource dataSource;

  NFTRepositoryImpl({required this.dataSource});

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
  Future<Either<Failure, int>> getTokenCounter() async {
    try {
      final result = await dataSource.getTokenCounter();

      return Right(result);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
