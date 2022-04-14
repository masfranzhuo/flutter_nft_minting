import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class StakeToken extends UseCase<Unit, Params> {
  final TokenRepository repository;

  StakeToken({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return repository.stakeToken(amount: params.amount);
  }
}

class Params {
  final int amount;

  const Params({required this.amount});
}
