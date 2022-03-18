import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/counter/data_sources/counter_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class CounterRepository {
  Future<Either<Failure, int>> getCounter();

  Future<Either<Failure, Unit>> incrementCounter();
}

@LazySingleton(as: CounterRepository)
class CounterRepositoryImpl extends CounterRepository {
  final CounterDataSource dataSource;

  CounterRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, int>> getCounter() async {
    try {
      final counter = await dataSource.getCounter();

      return Right(counter);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> incrementCounter() async {
    try {
      await dataSource.incrementCounter();

      return const Right(unit);
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
