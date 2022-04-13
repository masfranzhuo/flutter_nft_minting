// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StakingSummary _$$_StakingSummaryFromJson(Map<String, dynamic> json) =>
    _$_StakingSummary(
      totalAmount: json['totalAmount'] as int,
      stakes: (json['stakes'] as List<dynamic>)
          .map((e) => Stake.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StakingSummaryToJson(_$_StakingSummary instance) =>
    <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'stakes': instance.stakes,
    };
