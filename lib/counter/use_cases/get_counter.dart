import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/core/use_case.dart';
import 'package:flutter_smart_contract_counter/counter/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCounter extends UseCase<int, NoParams> {
  final CounterRepository repository;

  GetCounter({required this.repository});

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return repository.getCounter();
  }
}
