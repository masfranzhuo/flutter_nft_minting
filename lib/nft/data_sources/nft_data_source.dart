import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/platform/smart_contract_web3_client.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

abstract class NFTDataSource {
  Future<String> getName();
  Future<String> getSymbol();
  Future<int> getTokenCounter();
  Future<void> mint({required String tokenURI, required String address});
  Future<String> getImageUrl({required int tokenCounter});
}

@LazySingleton(as: NFTDataSource)
class NFTDataSourceImpl extends NFTDataSource {
  final String contractName = 'NFT';
  final String contractFileLocation = 'assets/abi/nft.json';

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

      return EtherAmount.fromUnitAndValue(
        EtherUnit.wei,
        BigInt.parse(result.toString()),
      ).getInEther.toInt();
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> mint({required String tokenURI, required String address}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'mint',
        params: [
          tokenURI,
          EthereumAddress.fromHex(address),
        ],
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<String> getImageUrl({required int tokenCounter}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'tokenURI',
        params: [BigInt.from(tokenCounter)],
      );
      return result;
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}