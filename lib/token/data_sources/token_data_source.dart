import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/platform/smart_contract_web3_client.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

abstract class TokenDataSource {
  Future<void> mint({required int amount, String? address});
  Future<void> burn({required int amount, String? address});
  Future<void> transfer({
    required String addressHexString,
    required int amount,
  });
  Future<String> getName();
  Future<String> getSymbol();
  Future<int> getTotalSupply();
  Future<void> stakeToken({required int amount});
  Future<void> withdrawStake({required int amount, int index = 0});
  Future<StakingSummary> getStakingSummary({required String address});
}

@LazySingleton(as: TokenDataSource)
class TokenDataSourceImpl extends TokenDataSource {
  final String contractName = 'Token';
  final String contractFileLocation = 'src/artifacts/Token.json';

  final SmartContractWeb3Client client;

  TokenDataSourceImpl({required this.client});

  @override
  Future<void> mint({required int amount, String? address}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'mint',
        params: [
          address ??
              EthPrivateKey.fromHex(dotenv.env['WALLET_PRIVATE_KEY']!).address,
          BigInt.from(amount),
        ],
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> burn({required int amount, String? address}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'burn',
        params: [
          address ??
              EthPrivateKey.fromHex(dotenv.env['WALLET_PRIVATE_KEY']!).address,
          BigInt.from(amount),
        ],
      );
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> transfer({
    required String addressHexString,
    required int amount,
  }) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      await client.sendTransaction(
        contract: contract,
        functionName: 'transfer',
        params: [
          EthereumAddress.fromHex(addressHexString),
          BigInt.from(amount),
        ],
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

      return EtherAmount.fromUnitAndValue(
        EtherUnit.wei,
        BigInt.parse(result.toString()),
      ).getInEther.toInt();
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<StakingSummary> getStakingSummary({required String address}) async {
    try {
      final contract = await client.getContract(
        contractName: contractName,
        contractFileLocation: contractFileLocation,
      );
      final result = await client.callContract(
        contract: contract,
        functionName: 'hasStake',
        params: [EthereumAddress.fromHex(address)],
      );

      print(result[0].toString());
      return StakingSummary.fromJson(result[0] as Map<String, dynamic>);
    } on Exception catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }

  @override
  Future<void> stakeToken({required int amount}) async {
    // TODO: implement stakeToken
    throw UnimplementedError();
  }

  @override
  Future<void> withdrawStake({required int amount, int index = 0}) async {
    // TODO: implement withdrawStake
    throw UnimplementedError();
  }
}

// [
//   '100000000000000000000',
//   [
//     [
//       '0x0000000000000000000000000000000000000000',
//       '0',
//       '0',
//       '0',
//       user: '0x0000000000000000000000000000000000000000',
//       amount: '0',
//       since: '0',
//       claimable: '0'
//     ],
//     [
//       '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
//       '100000000000000000000',
//       '1649850984',
//       '2000000000000000000',
//       user: '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
//       amount: '100000000000000000000',
//       since: '1649850984',
//       claimable: '2000000000000000000'
//     ]
//   ],
//   totalAmount: '100000000000000000000',
//   stakes: [
//     [
//       '0x0000000000000000000000000000000000000000',
//       '0',
//       '0',
//       '0',
//       user: '0x0000000000000000000000000000000000000000',
//       amount: '0',
//       since: '0',
//       claimable: '0'
//     ],
//     [
//       '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
//       '100000000000000000000',
//       '1649850984',
//       '2000000000000000000',
//       user: '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
//       amount: '100000000000000000000',
//       since: '1649850984',
//       claimable: '2000000000000000000'
//     ]
//   ]
// ]
