import 'package:web3dart/web3dart.dart';

DateTime dateTimeFromJson(String timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp.padRight(13, '0')));

String dateTimeToJson(DateTime dateTime) =>
    dateTime.millisecondsSinceEpoch.toString();

int etherFromJson(BigInt value) =>
    EtherAmount.fromUnitAndValue(EtherUnit.wei, value).getInEther.toInt();

BigInt etherToJson(int value) =>
    EtherAmount.fromUnitAndValue(EtherUnit.ether, value).getInWei;
