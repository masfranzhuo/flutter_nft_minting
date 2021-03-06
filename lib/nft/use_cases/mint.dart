import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/contracts.dart';

@lazySingleton
class Mint extends UseCase<bool, Params> {
  final NFTRepository repository;

  Mint({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    final tokenURI =
        'ipfs://${dotenv.env['JSON_CID']!}/kopon-${params.tokenCounter}.json';

    return repository.mint(
      contract: params.contract,
      tokenURI: tokenURI,
      address: params.address,
    );
  }
}

class Params {
  final DeployedContract contract;
  final int tokenCounter;
  final String address;

  const Params({
    required this.contract,
    required this.tokenCounter,
    required this.address,
  });
}
