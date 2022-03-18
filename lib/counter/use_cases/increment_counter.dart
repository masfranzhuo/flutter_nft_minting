import 'package:dartz/dartz.dart';
import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/core/use_case.dart';
import 'package:flutter_smart_contract_counter/counter/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncrementCounter extends UseCase<Unit, NoParams> {
  final CounterRepository repository;

  IncrementCounter({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return repository.incrementCounter();
  }
}
