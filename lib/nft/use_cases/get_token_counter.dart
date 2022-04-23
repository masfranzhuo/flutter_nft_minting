import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenCounter extends UseCase<int, NoParams> {
  final NFTRepository repository;

  GetTokenCounter({required this.repository});

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return repository.getTokenCounter();
  }
}
