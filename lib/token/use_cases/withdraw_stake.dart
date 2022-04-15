import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WithdrawStake extends UseCase<Unit, Params> {
  final TokenRepository repository;

  WithdrawStake({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return repository.withdrawStake(amount: params.amount, index: params.index);
  }
}

class Params {
  final int amount;
  final int index;

  const Params({required this.amount, this.index = 0});
}
