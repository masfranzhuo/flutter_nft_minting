import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/repositories/nft_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetImageURL extends UseCase<String, int> {
  final NFTRepository repository;

  GetImageURL({required this.repository});

  @override
  Future<Either<Failure, String>> call(int params) async {
    return repository.getImageURL(tokenCounter: params);
  }
}
