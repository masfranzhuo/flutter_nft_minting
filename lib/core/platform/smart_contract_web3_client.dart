import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

/// Rinkeby network use chainId:4
@lazySingleton
class SmartContractWeb3Client {
  late Client httpClient;
  late Web3Client web3Client;

  SmartContractWeb3Client({
    Client? httpClient,
    Web3Client? web3client,
  })  : httpClient = Client(),
        web3Client = Web3Client(dotenv.env['ALCHEMY_KEY_TEST']!, httpClient!);

  Future<DeployedContract> getContract({
    required String contractName,
    required String contractFileLocation,
  }) async {
    String abiString = await rootBundle.loadString(contractFileLocation);
    EthereumAddress contractAddress = EthereumAddress.fromHex(
      dotenv.env['CONTRACT_ADDRESS']!,
    );
    final contract = DeployedContract(
      ContractAbi.fromJson(abiString, contractName),
      contractAddress,
    );

    return contract;
  }

  Future<dynamic> callContract({
    required DeployedContract contract,
    required String functionName,
    List<dynamic> params = const [],
  }) async {
    var result = await web3Client.call(
      contract: contract,
      function: contract.function(functionName),
      params: params,
    );
    return result[0];
  }

  Future<dynamic> sendTransaction({
    required DeployedContract contract,
    required String functionName,
    List<dynamic> params = const [],
  }) async {
    final credentials =
        EthPrivateKey.fromHex(dotenv.env['WALLET_PRIVATE_KEY']!);
    await web3Client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: contract.function(functionName),
        parameters: params,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );
  }
}
