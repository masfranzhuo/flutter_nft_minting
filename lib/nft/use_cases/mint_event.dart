import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/contracts.dart';

@lazySingleton
class MintEvent extends UseCase<EventParams, DeployedContract> {
  final NFTRepository repository;

  MintEvent({required this.repository});

  @override
  Future<Either<Failure, EventParams>> call(DeployedContract params) async {
    return repository.mintEvent(contract: params);
  }
}
