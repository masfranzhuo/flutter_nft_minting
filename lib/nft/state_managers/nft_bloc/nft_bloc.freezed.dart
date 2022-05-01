// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NftEventTearOff {
  const _$NftEventTearOff();

  _Get get() {
    return const _Get();
  }

  _GetContract getContract() {
    return const _GetContract();
  }

  _Mint mint(
      {required DeployedContract contract,
      required int tokenCounter,
      required String address}) {
    return _Mint(
      contract: contract,
      tokenCounter: tokenCounter,
      address: address,
    );
  }
}

/// @nodoc
const $NftEvent = _$NftEventTearOff();

/// @nodoc
mixin _$NftEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function() getContract,
    required TResult Function(
            DeployedContract contract, int tokenCounter, String address)
        mint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_GetContract value) getContract,
    required TResult Function(_Mint value) mint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftEventCopyWith<$Res> {
  factory $NftEventCopyWith(NftEvent value, $Res Function(NftEvent) then) =
      _$NftEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NftEventCopyWithImpl<$Res> implements $NftEventCopyWith<$Res> {
  _$NftEventCopyWithImpl(this._value, this._then);

  final NftEvent _value;
  // ignore: unused_field
  final $Res Function(NftEvent) _then;
}

/// @nodoc
abstract class _$GetCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) then) =
      __$GetCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetCopyWithImpl<$Res> extends _$NftEventCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(_Get _value, $Res Function(_Get) _then)
      : super(_value, (v) => _then(v as _Get));

  @override
  _Get get _value => super._value as _Get;
}

/// @nodoc

class _$_Get implements _Get {
  const _$_Get();

  @override
  String toString() {
    return 'NftEvent.get()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Get);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function() getContract,
    required TResult Function(
            DeployedContract contract, int tokenCounter, String address)
        mint,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_GetContract value) getContract,
    required TResult Function(_Mint value) mint,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _Get implements NftEvent {
  const factory _Get() = _$_Get;
}

/// @nodoc
abstract class _$GetContractCopyWith<$Res> {
  factory _$GetContractCopyWith(
          _GetContract value, $Res Function(_GetContract) then) =
      __$GetContractCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetContractCopyWithImpl<$Res> extends _$NftEventCopyWithImpl<$Res>
    implements _$GetContractCopyWith<$Res> {
  __$GetContractCopyWithImpl(
      _GetContract _value, $Res Function(_GetContract) _then)
      : super(_value, (v) => _then(v as _GetContract));

  @override
  _GetContract get _value => super._value as _GetContract;
}

/// @nodoc

class _$_GetContract implements _GetContract {
  const _$_GetContract();

  @override
  String toString() {
    return 'NftEvent.getContract()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetContract);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function() getContract,
    required TResult Function(
            DeployedContract contract, int tokenCounter, String address)
        mint,
  }) {
    return getContract();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
  }) {
    return getContract?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
    required TResult orElse(),
  }) {
    if (getContract != null) {
      return getContract();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_GetContract value) getContract,
    required TResult Function(_Mint value) mint,
  }) {
    return getContract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
  }) {
    return getContract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
    required TResult orElse(),
  }) {
    if (getContract != null) {
      return getContract(this);
    }
    return orElse();
  }
}

abstract class _GetContract implements NftEvent {
  const factory _GetContract() = _$_GetContract;
}

/// @nodoc
abstract class _$MintCopyWith<$Res> {
  factory _$MintCopyWith(_Mint value, $Res Function(_Mint) then) =
      __$MintCopyWithImpl<$Res>;
  $Res call({DeployedContract contract, int tokenCounter, String address});
}

/// @nodoc
class __$MintCopyWithImpl<$Res> extends _$NftEventCopyWithImpl<$Res>
    implements _$MintCopyWith<$Res> {
  __$MintCopyWithImpl(_Mint _value, $Res Function(_Mint) _then)
      : super(_value, (v) => _then(v as _Mint));

  @override
  _Mint get _value => super._value as _Mint;

  @override
  $Res call({
    Object? contract = freezed,
    Object? tokenCounter = freezed,
    Object? address = freezed,
  }) {
    return _then(_Mint(
      contract: contract == freezed
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as DeployedContract,
      tokenCounter: tokenCounter == freezed
          ? _value.tokenCounter
          : tokenCounter // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Mint implements _Mint {
  const _$_Mint(
      {required this.contract,
      required this.tokenCounter,
      required this.address});

  @override
  final DeployedContract contract;
  @override
  final int tokenCounter;
  @override
  final String address;

  @override
  String toString() {
    return 'NftEvent.mint(contract: $contract, tokenCounter: $tokenCounter, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Mint &&
            const DeepCollectionEquality().equals(other.contract, contract) &&
            const DeepCollectionEquality()
                .equals(other.tokenCounter, tokenCounter) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contract),
      const DeepCollectionEquality().hash(tokenCounter),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$MintCopyWith<_Mint> get copyWith =>
      __$MintCopyWithImpl<_Mint>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function() getContract,
    required TResult Function(
            DeployedContract contract, int tokenCounter, String address)
        mint,
  }) {
    return mint(contract, tokenCounter, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
  }) {
    return mint?.call(contract, tokenCounter, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function()? getContract,
    TResult Function(
            DeployedContract contract, int tokenCounter, String address)?
        mint,
    required TResult orElse(),
  }) {
    if (mint != null) {
      return mint(contract, tokenCounter, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_GetContract value) getContract,
    required TResult Function(_Mint value) mint,
  }) {
    return mint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
  }) {
    return mint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_GetContract value)? getContract,
    TResult Function(_Mint value)? mint,
    required TResult orElse(),
  }) {
    if (mint != null) {
      return mint(this);
    }
    return orElse();
  }
}

abstract class _Mint implements NftEvent {
  const factory _Mint(
      {required DeployedContract contract,
      required int tokenCounter,
      required String address}) = _$_Mint;

  DeployedContract get contract;
  int get tokenCounter;
  String get address;
  @JsonKey(ignore: true)
  _$MintCopyWith<_Mint> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$NftStateTearOff {
  const _$NftStateTearOff();

  _NftState call(
      {Failure? failure,
      bool isLoading = false,
      String? name,
      String? symbol,
      int tokenCounter = 0,
      String? imageURL,
      DeployedContract? contract}) {
    return _NftState(
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
const $NftState = _$NftStateTearOff();

/// @nodoc
mixin _$NftState {
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  int get tokenCounter => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;
  DeployedContract? get contract => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NftStateCopyWith<NftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftStateCopyWith<$Res> {
  factory $NftStateCopyWith(NftState value, $Res Function(NftState) then) =
      _$NftStateCopyWithImpl<$Res>;
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
class _$NftStateCopyWithImpl<$Res> implements $NftStateCopyWith<$Res> {
  _$NftStateCopyWithImpl(this._value, this._then);

  final NftState _value;
  // ignore: unused_field
  final $Res Function(NftState) _then;

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
abstract class _$NftStateCopyWith<$Res> implements $NftStateCopyWith<$Res> {
  factory _$NftStateCopyWith(_NftState value, $Res Function(_NftState) then) =
      __$NftStateCopyWithImpl<$Res>;
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
class __$NftStateCopyWithImpl<$Res> extends _$NftStateCopyWithImpl<$Res>
    implements _$NftStateCopyWith<$Res> {
  __$NftStateCopyWithImpl(_NftState _value, $Res Function(_NftState) _then)
      : super(_value, (v) => _then(v as _NftState));

  @override
  _NftState get _value => super._value as _NftState;

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
    return _then(_NftState(
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

class _$_NftState extends _NftState {
  _$_NftState(
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
    return 'NftState(failure: $failure, isLoading: $isLoading, name: $name, symbol: $symbol, tokenCounter: $tokenCounter, imageURL: $imageURL, contract: $contract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NftState &&
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
  _$NftStateCopyWith<_NftState> get copyWith =>
      __$NftStateCopyWithImpl<_NftState>(this, _$identity);
}

abstract class _NftState extends NftState {
  factory _NftState(
      {Failure? failure,
      bool isLoading,
      String? name,
      String? symbol,
      int tokenCounter,
      String? imageURL,
      DeployedContract? contract}) = _$_NftState;
  _NftState._() : super._();

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
  _$NftStateCopyWith<_NftState> get copyWith =>
      throw _privateConstructorUsedError;
}
