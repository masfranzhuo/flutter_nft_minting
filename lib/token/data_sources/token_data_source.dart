import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/platform/smart_contract_web3_client.dart';
import 'package:injectable/injectable.dart';

abstract class TokenDataSource {
  Future<void> mint({required int amount});
  Future<void> burn({required int amount});
  Future<String> getName();
  Future<String> getSymbol();
  Future<int> getTotalSupply();
}

@LazySingleton(as: TokenDataSource)
class TokenDataSourceImpl extends TokenDataSource {
  final String contractName = 'Token';
  final String contractFileLocation = 'src/artifacts/Token.json';

  final SmartContractWeb3Client client;

  TokenDataSourceImpl({required this.client});

  @override
  Future<void> mint({required int amount}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'mint',
        params: [amount],
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> burn({required int amount}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'burn',
        params: [amount],
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<String> getName() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'name',
      );

      return result;
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<String> getSymbol() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'symbol',
      );

      return result;
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<int> getTotalSupply() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'totalSupply',
      );

      return result.toInt();
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}
