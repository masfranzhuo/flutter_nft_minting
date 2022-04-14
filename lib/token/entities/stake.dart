import 'package:flutter_token/core/utility/formater.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stake.freezed.dart';
part 'stake.g.dart';

@freezed
class Stake with _$Stake {
  factory Stake({
    required String address,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
        required DateTime since,
    @JsonKey(fromJson: etherFromJson, toJson: etherToJson) required int amount,
    @JsonKey(fromJson: etherFromJson, toJson: etherToJson)
    @Default(0)
        int claimable,
  }) = _Stake;

  factory Stake.fromJson(Map<String, dynamic> json) => _$StakeFromJson(json);
}
