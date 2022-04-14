// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stake _$$_StakeFromJson(Map<String, dynamic> json) => _$_Stake(
      address: json['address'] as String,
      since: dateTimeFromJson(json['since'] as String),
      amount: etherFromJson(json['amount'] as BigInt),
      claimable: json['claimable'] == null
          ? 0
          : etherFromJson(json['claimable'] as BigInt),
    );

Map<String, dynamic> _$$_StakeToJson(_$_Stake instance) => <String, dynamic>{
      'address': instance.address,
      'since': dateTimeToJson(instance.since),
      'amount': etherToJson(instance.amount),
      'claimable': etherToJson(instance.claimable),
    };
