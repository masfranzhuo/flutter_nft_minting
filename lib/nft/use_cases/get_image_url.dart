import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

@lazySingleton
class GetImageURL extends UseCase<String, Params> {
  final NFTRepository repository;

  GetImageURL({required this.repository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return repository.getImageURL(
      contract: params.contract,
      tokenCounter: params.tokenCounter,
    );
  }
}

class Params {
  final DeployedContract contract;
  final int tokenCounter;

  const Params({
    required this.contract,
    required this.tokenCounter,
  });
}
