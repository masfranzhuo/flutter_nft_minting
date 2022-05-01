import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/contracts.dart';

@lazySingleton
class GetContract extends UseCase<DeployedContract, NoParams> {
  final NFTRepository repository;

  GetContract({required this.repository});

  @override
  Future<Either<Failure, DeployedContract>> call(NoParams params) async {
    return repository.getContract();
  }
}
