import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetName extends UseCase<String, NoParams> {
  final NFTRepository repository;

  GetName({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return repository.getName();
  }
}
