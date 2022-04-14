import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:flutter_token/token/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetStakingSummary extends UseCase<StakingSummary, Params> {
  final TokenRepository repository;

  GetStakingSummary({required this.repository});

  @override
  Future<Either<Failure, StakingSummary>> call(Params params) async {
    return repository.getStakingSummary(address: params.address);
  }
}

class Params {
  final String address;

  const Params({required this.address});
}
