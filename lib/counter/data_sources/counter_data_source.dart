import 'package:flutter_smart_contract_counter/core/error/failure.dart';
import 'package:flutter_smart_contract_counter/core/platform/smart_contract_web3_client.dart';
import 'package:injectable/injectable.dart';

abstract class CounterDataSource {
  Future<int> getCounter();

  Future<void> incrementCounter();
}

@LazySingleton(as: CounterDataSource)
class CounterDataSourceImpl extends CounterDataSource {
  final String contractName = 'Counter';
  final String contractFileLocation = 'src/artifacts/Counter.json';

  final SmartContractWeb3Client client;

  CounterDataSourceImpl({required this.client});

  @override
  Future<int> getCounter() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final counter = await client.callContract(
        contract: contract,
        functionName: 'counter',
      );

      return counter.toInt();
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> incrementCounter() async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'incrementCounter',
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}
