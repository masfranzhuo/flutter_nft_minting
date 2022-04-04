import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Transfer extends UseCase<Unit, Params> {
  final TokenRepository repository;

  Transfer({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return repository.transfer(
      addressHexString: params.addressHexString,
      amount: params.amount,
    );
  }
}

class Params {
  final String addressHexString;
  final int amount;

  const Params({
    required this.addressHexString,
    required this.amount,
  });
}
