import 'package:flutter_token/token/entities/stake.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:flutter_token/token/entities/token.dart';
import 'package:web3dart/credentials.dart';

final tokenFixture = Token(name: 'Token Name', symbol: 'TN', totalSupply: 1000);
final tokenJson = <String, dynamic>{
  'name': 'Token Name',
  'symbol': 'TN',
  'totalSupply': 1000,
};

// final timeStamp = (DateTime.now().millisecondsSinceEpoch).toString();
const timeStamp = '1649850984';
final stakeFixture = Stake(
  address: '0x47e2935e04cda3bafd7e399244d430914939d544',
  amount: 100,
  claimable: 50,
  since: DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)),
);
final stakeJson = <String, dynamic>{
  'address': '0x47e2935e04cda3bafd7e399244d430914939d544',
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
final stakingSummaryList = <dynamic>[
  BigInt.parse('100000000000000000000'),
  [
    [
      EthereumAddress.fromHex('0x47e2935e04cda3bafd7e399244d430914939d544'),
      BigInt.parse('100000000000000000000'),
      BigInt.parse(timeStamp),
      BigInt.parse('50000000000000000000'),
    ]
  ]
];
