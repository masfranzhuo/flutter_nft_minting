import 'package:web3dart/web3dart.dart';

DateTime dateTimeFromJson(String timestamp) =>
    DateTime.fromMicrosecondsSinceEpoch(int.parse(timestamp));

String dateTimeToJson(DateTime dateTime) =>
    dateTime.microsecondsSinceEpoch.toString();

int etherFromJson(BigInt value) =>
    EtherAmount.fromUnitAndValue(EtherUnit.wei, value).getInEther.toInt();

BigInt etherToJson(int value) =>
    EtherAmount.fromUnitAndValue(EtherUnit.ether, value).getInWei;
