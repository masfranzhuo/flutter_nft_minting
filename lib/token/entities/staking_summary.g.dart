// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StakingSummary _$$_StakingSummaryFromJson(Map json) => $checkedCreate(
      r'_$_StakingSummary',
      json,
      ($checkedConvert) {
        final val = _$_StakingSummary(
          totalAmount: $checkedConvert(
              'totalAmount', (v) => v == null ? 0 : etherFromJson(v as BigInt)),
          stakes: $checkedConvert(
              'stakes',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          Stake.fromJson(Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_StakingSummaryToJson(_$_StakingSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalAmount', etherToJson(instance.totalAmount));
  val['stakes'] = instance.stakes.map((e) => e.toJson()).toList();
  return val;
}
