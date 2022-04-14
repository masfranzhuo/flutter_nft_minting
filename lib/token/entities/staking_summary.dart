import 'package:flutter_token/core/utility/formater.dart';
import 'package:flutter_token/token/entities/stake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staking_summary.freezed.dart';
part 'staking_summary.g.dart';

@freezed
class StakingSummary with _$StakingSummary {
  @JsonSerializable(
    checked: true,
    anyMap: true,
    includeIfNull: false,
    explicitToJson: true,
  )
  factory StakingSummary({
    @JsonKey(fromJson: etherFromJson, toJson: etherToJson)
    @Default(0)
        int totalAmount,
    @Default([]) List<Stake> stakes,
  }) = _StakingSummary;

  factory StakingSummary.fromJson(Map<String, dynamic> json) =>
      _$StakingSummaryFromJson(json);
}
