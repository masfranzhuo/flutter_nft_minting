// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'staking_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StakingSummary _$StakingSummaryFromJson(Map<String, dynamic> json) {
  return _StakingSummary.fromJson(json);
}

/// @nodoc
class _$StakingSummaryTearOff {
  const _$StakingSummaryTearOff();

  _StakingSummary call(
      {@JsonKey(fromJson: etherFromJson, toJson: etherToJson)
          int totalAmount = 0,
      List<Stake> stakes = const []}) {
    return _StakingSummary(
      totalAmount: totalAmount,
      stakes: stakes,
    );
  }

  StakingSummary fromJson(Map<String, Object?> json) {
    return StakingSummary.fromJson(json);
  }
}

/// @nodoc
const $StakingSummary = _$StakingSummaryTearOff();

/// @nodoc
mixin _$StakingSummary {
  @JsonKey(fromJson: etherFromJson, toJson: etherToJson)
  int get totalAmount => throw _privateConstructorUsedError;
  List<Stake> get stakes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StakingSummaryCopyWith<StakingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakingSummaryCopyWith<$Res> {
  factory $StakingSummaryCopyWith(
          StakingSummary value, $Res Function(StakingSummary) then) =
      _$StakingSummaryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: etherFromJson, toJson: etherToJson) int totalAmount,
      List<Stake> stakes});
}

/// @nodoc
class _$StakingSummaryCopyWithImpl<$Res>
    implements $StakingSummaryCopyWith<$Res> {
  _$StakingSummaryCopyWithImpl(this._value, this._then);

  final StakingSummary _value;
  // ignore: unused_field
  final $Res Function(StakingSummary) _then;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? stakes = freezed,
  }) {
    return _then(_value.copyWith(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      stakes: stakes == freezed
          ? _value.stakes
          : stakes // ignore: cast_nullable_to_non_nullable
              as List<Stake>,
    ));
  }
}

/// @nodoc
abstract class _$StakingSummaryCopyWith<$Res>
    implements $StakingSummaryCopyWith<$Res> {
  factory _$StakingSummaryCopyWith(
          _StakingSummary value, $Res Function(_StakingSummary) then) =
      __$StakingSummaryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: etherFromJson, toJson: etherToJson) int totalAmount,
      List<Stake> stakes});
}

/// @nodoc
class __$StakingSummaryCopyWithImpl<$Res>
    extends _$StakingSummaryCopyWithImpl<$Res>
    implements _$StakingSummaryCopyWith<$Res> {
  __$StakingSummaryCopyWithImpl(
      _StakingSummary _value, $Res Function(_StakingSummary) _then)
      : super(_value, (v) => _then(v as _StakingSummary));

  @override
  _StakingSummary get _value => super._value as _StakingSummary;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? stakes = freezed,
  }) {
    return _then(_StakingSummary(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      stakes: stakes == freezed
          ? _value.stakes
          : stakes // ignore: cast_nullable_to_non_nullable
              as List<Stake>,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    checked: true, anyMap: true, includeIfNull: false, explicitToJson: true)
class _$_StakingSummary implements _StakingSummary {
  _$_StakingSummary(
      {@JsonKey(fromJson: etherFromJson, toJson: etherToJson)
          this.totalAmount = 0,
      this.stakes = const []});

  factory _$_StakingSummary.fromJson(Map<String, dynamic> json) =>
      _$$_StakingSummaryFromJson(json);

  @override
  @JsonKey(fromJson: etherFromJson, toJson: etherToJson)
  final int totalAmount;
  @JsonKey()
  @override
  final List<Stake> stakes;

  @override
  String toString() {
    return 'StakingSummary(totalAmount: $totalAmount, stakes: $stakes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StakingSummary &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality().equals(other.stakes, stakes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(stakes));

  @JsonKey(ignore: true)
  @override
  _$StakingSummaryCopyWith<_StakingSummary> get copyWith =>
      __$StakingSummaryCopyWithImpl<_StakingSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StakingSummaryToJson(this);
  }
}

abstract class _StakingSummary implements StakingSummary {
  factory _StakingSummary(
      {@JsonKey(fromJson: etherFromJson, toJson: etherToJson) int totalAmount,
      List<Stake> stakes}) = _$_StakingSummary;

  factory _StakingSummary.fromJson(Map<String, dynamic> json) =
      _$_StakingSummary.fromJson;

  @override
  @JsonKey(fromJson: etherFromJson, toJson: etherToJson)
  int get totalAmount;
  @override
  List<Stake> get stakes;
  @override
  @JsonKey(ignore: true)
  _$StakingSummaryCopyWith<_StakingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
