import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/platform/smart_contract_web3_client.dart';
import 'package:injectable/injectable.dart';

abstract class TokenDataSource {
  Future<void> mint();

  Future<void> burn();
}

@LazySingleton(as: TokenDataSource)
class TokenDataSourceImpl extends TokenDataSource {
  final String contractName = 'Token';
  final String contractFileLocation = 'src/artifacts/Token.json';

  final SmartContractWeb3Client client;

  TokenDataSourceImpl({required this.client});

  @override
  Future<void> mint() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'mint',
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> burn() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'burn',
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}
