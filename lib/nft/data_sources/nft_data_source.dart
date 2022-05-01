import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

abstract class NFTDataSource {
  Future<String> getName();
  Future<String> getSymbol();
  Future<int> getTokenCounter();
  Future<DeployedContract> getContract();
  Future<void> mint({
    required DeployedContract contract,
    required String tokenURI,
    required String address,
  });
  Future<String> getImageUrl({
    required DeployedContract contract,
    required int tokenCounter,
  });
  Future<EventParams> mintEvent({required DeployedContract contract});
}

@LazySingleton(as: NFTDataSource)
class NFTDataSourceImpl extends NFTDataSource {
  final String contractName = 'NFT';
  final String contractFileLocation = 'assets/abi/nft.json';
  final String eventMint = 'Mint';

  final SmartContractWeb3Client client;

  NFTDataSourceImpl({required this.client});

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
      throw Exception(e.toString());
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<int> getTokenCounter() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'tokenCounter',
      );

      return int.parse(result.toString());
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<DeployedContract> getContract() async {
    try {
      return await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> mint({
    required DeployedContract contract,
    required String tokenURI,
    required String address,
  }) async {
    try {
      await client.sendTransaction(
        contract: contract,
        functionName: 'mint',
        params: [
          tokenURI,
          EthereumAddress.fromHex(address),
        ],
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> getImageUrl({
    required DeployedContract contract,
    required int tokenCounter,
  }) async {
    try {
      final result = await client.callContract(
        contract: contract,
        functionName: 'tokenURI',
        params: [BigInt.from(tokenCounter)],
      );
      return result;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<EventParams> mintEvent({required DeployedContract contract}) async {
    try {
      final result = await client.getEvent(
        contract: contract,
        eventName: eventMint,
      );
      return result;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
