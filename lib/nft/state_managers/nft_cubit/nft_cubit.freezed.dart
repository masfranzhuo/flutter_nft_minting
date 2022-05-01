// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NFTStateTearOff {
  const _$NFTStateTearOff();

  _NFTState call(
      {Failure? failure,
      bool isLoading = false,
      String? name,
      String? symbol,
      int tokenCounter = 0,
      String? imageURL,
      DeployedContract? contract}) {
    return _NFTState(
      failure: failure,
      isLoading: isLoading,
      name: name,
      symbol: symbol,
      tokenCounter: tokenCounter,
      imageURL: imageURL,
      contract: contract,
    );
  }
}

/// @nodoc
const $NFTState = _$NFTStateTearOff();

/// @nodoc
mixin _$NFTState {
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  int get tokenCounter => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;
  DeployedContract? get contract => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NFTStateCopyWith<NFTState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTStateCopyWith<$Res> {
  factory $NFTStateCopyWith(NFTState value, $Res Function(NFTState) then) =
      _$NFTStateCopyWithImpl<$Res>;
  $Res call(
      {Failure? failure,
      bool isLoading,
      String? name,
      String? symbol,
      int tokenCounter,
      String? imageURL,
      DeployedContract? contract});
}

/// @nodoc
class _$NFTStateCopyWithImpl<$Res> implements $NFTStateCopyWith<$Res> {
  _$NFTStateCopyWithImpl(this._value, this._then);

  final NFTState _value;
  // ignore: unused_field
  final $Res Function(NFTState) _then;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? tokenCounter = freezed,
    Object? imageURL = freezed,
    Object? contract = freezed,
  }) {
    return _then(_value.copyWith(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCounter: tokenCounter == freezed
          ? _value.tokenCounter
          : tokenCounter // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: contract == freezed
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as DeployedContract?,
    ));
  }
}

/// @nodoc
abstract class _$NFTStateCopyWith<$Res> implements $NFTStateCopyWith<$Res> {
  factory _$NFTStateCopyWith(_NFTState value, $Res Function(_NFTState) then) =
      __$NFTStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Failure? failure,
      bool isLoading,
      String? name,
      String? symbol,
      int tokenCounter,
      String? imageURL,
      DeployedContract? contract});
}

/// @nodoc
class __$NFTStateCopyWithImpl<$Res> extends _$NFTStateCopyWithImpl<$Res>
    implements _$NFTStateCopyWith<$Res> {
  __$NFTStateCopyWithImpl(_NFTState _value, $Res Function(_NFTState) _then)
      : super(_value, (v) => _then(v as _NFTState));

  @override
  _NFTState get _value => super._value as _NFTState;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? tokenCounter = freezed,
    Object? imageURL = freezed,
    Object? contract = freezed,
  }) {
    return _then(_NFTState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCounter: tokenCounter == freezed
          ? _value.tokenCounter
          : tokenCounter // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: contract == freezed
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as DeployedContract?,
    ));
  }
}

/// @nodoc

class _$_NFTState extends _NFTState {
  _$_NFTState(
      {this.failure,
      this.isLoading = false,
      this.name,
      this.symbol,
      this.tokenCounter = 0,
      this.imageURL,
      this.contract})
      : super._();

  @override
  final Failure? failure;
  @JsonKey()
  @override
  final bool isLoading;
  @override
  final String? name;
  @override
  final String? symbol;
  @JsonKey()
  @override
  final int tokenCounter;
  @override
  final String? imageURL;
  @override
  final DeployedContract? contract;

  @override
  String toString() {
    return 'NFTState(failure: $failure, isLoading: $isLoading, name: $name, symbol: $symbol, tokenCounter: $tokenCounter, imageURL: $imageURL, contract: $contract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NFTState &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality()
                .equals(other.tokenCounter, tokenCounter) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.contract, contract));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(tokenCounter),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(contract));

  @JsonKey(ignore: true)
  @override
  _$NFTStateCopyWith<_NFTState> get copyWith =>
      __$NFTStateCopyWithImpl<_NFTState>(this, _$identity);
}

abstract class _NFTState extends NFTState {
  factory _NFTState(
      {Failure? failure,
      bool isLoading,
      String? name,
      String? symbol,
      int tokenCounter,
      String? imageURL,
      DeployedContract? contract}) = _$_NFTState;
  _NFTState._() : super._();

  @override
  Failure? get failure;
  @override
  bool get isLoading;
  @override
  String? get name;
  @override
  String? get symbol;
  @override
  int get tokenCounter;
  @override
  String? get imageURL;
  @override
  DeployedContract? get contract;
  @override
  @JsonKey(ignore: true)
  _$NFTStateCopyWith<_NFTState> get copyWith =>
      throw _privateConstructorUsedError;
}
