import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetName extends UseCase<String, NoParams> {
  final TokenRepository repository;

  GetName({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return repository.getName();
  }
}
