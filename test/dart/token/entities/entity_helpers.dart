import 'package:flutter_token/token/entities/stake.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:flutter_token/token/entities/token.dart';

final tokenFixture = Token(name: 'Token Name', symbol: 'TN', totalSupply: 1000);
final tokenJson = <String, dynamic>{
  'name': 'Token Name',
  'symbol': 'TN',
  'totalSupply': 1000,
};

final timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
final stakeFixture = Stake(
  address: '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
  amount: 100,
  claimable: 50,
  since: DateTime.fromMicrosecondsSinceEpoch(int.parse(timeStamp)),
);
final stakeJson = <String, dynamic>{
  'address': '0xCd23CCcdD5BF3Bf4d8c21ee41F9fEB7F4b871326',
  'amount': BigInt.parse('100000000000000000000'),
  'claimable': BigInt.parse('50000000000000000000'),
  'since': timeStamp,
};

final stakingSummaryFixture = StakingSummary(
  totalAmount: 100,
  stakes: [stakeFixture],
);
final stakingSummaryJson = <String, dynamic>{
  'totalAmount': BigInt.parse('100000000000000000000'),
  'stakes': [stakeFixture.toJson()],
};
