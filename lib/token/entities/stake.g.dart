// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stake _$$_StakeFromJson(Map<String, dynamic> json) => _$_Stake(
      address: json['address'] as String,
      sinceTimestamp: json['sinceTimestamp'] as String,
      amount: json['amount'] as int,
      claimable: json['claimable'] as int,
    );

Map<String, dynamic> _$$_StakeToJson(_$_Stake instance) => <String, dynamic>{
      'address': instance.address,
      'sinceTimestamp': instance.sinceTimestamp,
      'amount': instance.amount,
      'claimable': instance.claimable,
    };
