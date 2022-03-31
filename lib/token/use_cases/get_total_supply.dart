import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTotalSupply extends UseCase<int, NoParams> {
  final TokenRepository repository;

  GetTotalSupply({required this.repository});

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return repository.getTotalSupply();
  }
}
