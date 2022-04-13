import 'package:freezed_annotation/freezed_annotation.dart';

part 'stake.freezed.dart';
part 'stake.g.dart';

@freezed
class Stake with _$Stake {
  factory Stake({
    required String address,
    required String sinceTimestamp,
    required int amount,
    required int claimable,
  }) = _Stake;

  factory Stake.fromJson(Map<String, dynamic> json) => _$StakeFromJson(json);
}