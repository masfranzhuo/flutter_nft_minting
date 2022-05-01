import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

/// Rinkeby network use chainId:4
@lazySingleton
class SmartContractWeb3Client {
  late Client httpClient;
  late Web3Client web3Client;

  SmartContractWeb3Client({
    Client? httpClient,
    Web3Client? web3client,
  })  : httpClient = Client(),
        web3Client = Web3Client(
          dotenv.env['ALCHEMY_KEY_TEST']!,
          httpClient!,
          socketConnector: () {
            return IOWebSocketChannel.connect(
                    dotenv.env['ALCHEMY_WS_KEY_TEST']!)
                .cast<String>();
          },
        );

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

  Future<EventParams> getEvent({
    required DeployedContract contract,
    required String eventName,
  }) async {
    final contractEvent = contract.event(eventName);
    final stream = web3Client.events(FilterOptions.events(
      contract: contract,
      event: contractEvent,
    ));

    return EventParams(stream: stream, contractEvent: contractEvent);
  }
}

class EventParams {
  final Stream<FilterEvent> stream;
  final ContractEvent contractEvent;

  EventParams({
    required this.stream,
    required this.contractEvent,
  });
}
