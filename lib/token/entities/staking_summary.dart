import 'package:flutter_token/token/entities/stake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staking_summary.freezed.dart';
part 'staking_summary.g.dart';

@freezed
class StakingSummary with _$StakingSummary {
  factory StakingSummary({
    required int totalAmount,
    required List<Stake> stakes,
  }) = _StakingSummary;

  factory StakingSummary.fromJson(Map<String, dynamic> json) => _$StakingSummaryFromJson(json);
}
