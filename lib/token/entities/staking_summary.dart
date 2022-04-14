import 'package:flutter_token/core/utility/formater.dart';
import 'package:flutter_token/token/entities/stake.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/web3dart.dart';

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

  factory StakingSummary.fromList(List<dynamic> list) => StakingSummary(
        totalAmount: etherFromJson(list[0] as BigInt),
        stakes: (list[1] as List<dynamic>)
            .map(
              (stake) => Stake(
                address: (stake[0] as EthereumAddress).toString(),
                amount: etherFromJson(stake[1] as BigInt),
                since: dateTimeFromJson(
                  (stake[2] as BigInt).toString(),
                ),
                claimable: etherFromJson(stake[3] as BigInt),
              ),
            )
            .toList(),
      );
}
