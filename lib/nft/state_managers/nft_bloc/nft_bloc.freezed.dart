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

  _Mint mint({required int tokenCounter, required String address}) {
    return _Mint(
      tokenCounter: tokenCounter,
      address: address,
    );
  }

  _GetImageURL getImageUrl({required int tokenCounter}) {
    return _GetImageURL(
      tokenCounter: tokenCounter,
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
    required TResult Function(int tokenCounter, String address) mint,
    required TResult Function(int tokenCounter) getImageUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Mint value) mint,
    required TResult Function(_GetImageURL value) getImageUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
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
    required TResult Function(int tokenCounter, String address) mint,
    required TResult Function(int tokenCounter) getImageUrl,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
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
    required TResult Function(_Mint value) mint,
    required TResult Function(_GetImageURL value) getImageUrl,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
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
abstract class _$MintCopyWith<$Res> {
  factory _$MintCopyWith(_Mint value, $Res Function(_Mint) then) =
      __$MintCopyWithImpl<$Res>;
  $Res call({int tokenCounter, String address});
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
    Object? tokenCounter = freezed,
    Object? address = freezed,
  }) {
    return _then(_Mint(
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
  const _$_Mint({required this.tokenCounter, required this.address});

  @override
  final int tokenCounter;
  @override
  final String address;

  @override
  String toString() {
    return 'NftEvent.mint(tokenCounter: $tokenCounter, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Mint &&
            const DeepCollectionEquality()
                .equals(other.tokenCounter, tokenCounter) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
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
    required TResult Function(int tokenCounter, String address) mint,
    required TResult Function(int tokenCounter) getImageUrl,
  }) {
    return mint(tokenCounter, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
  }) {
    return mint?.call(tokenCounter, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
    required TResult orElse(),
  }) {
    if (mint != null) {
      return mint(tokenCounter, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Mint value) mint,
    required TResult Function(_GetImageURL value) getImageUrl,
  }) {
    return mint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
  }) {
    return mint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
    required TResult orElse(),
  }) {
    if (mint != null) {
      return mint(this);
    }
    return orElse();
  }
}

abstract class _Mint implements NftEvent {
  const factory _Mint({required int tokenCounter, required String address}) =
      _$_Mint;

  int get tokenCounter;
  String get address;
  @JsonKey(ignore: true)
  _$MintCopyWith<_Mint> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetImageURLCopyWith<$Res> {
  factory _$GetImageURLCopyWith(
          _GetImageURL value, $Res Function(_GetImageURL) then) =
      __$GetImageURLCopyWithImpl<$Res>;
  $Res call({int tokenCounter});
}

/// @nodoc
class __$GetImageURLCopyWithImpl<$Res> extends _$NftEventCopyWithImpl<$Res>
    implements _$GetImageURLCopyWith<$Res> {
  __$GetImageURLCopyWithImpl(
      _GetImageURL _value, $Res Function(_GetImageURL) _then)
      : super(_value, (v) => _then(v as _GetImageURL));

  @override
  _GetImageURL get _value => super._value as _GetImageURL;

  @override
  $Res call({
    Object? tokenCounter = freezed,
  }) {
    return _then(_GetImageURL(
      tokenCounter: tokenCounter == freezed
          ? _value.tokenCounter
          : tokenCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetImageURL implements _GetImageURL {
  const _$_GetImageURL({required this.tokenCounter});

  @override
  final int tokenCounter;

  @override
  String toString() {
    return 'NftEvent.getImageUrl(tokenCounter: $tokenCounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetImageURL &&
            const DeepCollectionEquality()
                .equals(other.tokenCounter, tokenCounter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tokenCounter));

  @JsonKey(ignore: true)
  @override
  _$GetImageURLCopyWith<_GetImageURL> get copyWith =>
      __$GetImageURLCopyWithImpl<_GetImageURL>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(int tokenCounter, String address) mint,
    required TResult Function(int tokenCounter) getImageUrl,
  }) {
    return getImageUrl(tokenCounter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
  }) {
    return getImageUrl?.call(tokenCounter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(int tokenCounter, String address)? mint,
    TResult Function(int tokenCounter)? getImageUrl,
    required TResult orElse(),
  }) {
    if (getImageUrl != null) {
      return getImageUrl(tokenCounter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Mint value) mint,
    required TResult Function(_GetImageURL value) getImageUrl,
  }) {
    return getImageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
  }) {
    return getImageUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Mint value)? mint,
    TResult Function(_GetImageURL value)? getImageUrl,
    required TResult orElse(),
  }) {
    if (getImageUrl != null) {
      return getImageUrl(this);
    }
    return orElse();
  }
}

abstract class _GetImageURL implements NftEvent {
  const factory _GetImageURL({required int tokenCounter}) = _$_GetImageURL;

  int get tokenCounter;
  @JsonKey(ignore: true)
  _$GetImageURLCopyWith<_GetImageURL> get copyWith =>
      throw _privateConstructorUsedError;
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
      String? imageURL}) {
    return _NftState(
      failure: failure,
      isLoading: isLoading,
      name: name,
      symbol: symbol,
      tokenCounter: tokenCounter,
      imageURL: imageURL,
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
      String? imageURL});
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
      String? imageURL});
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
      this.imageURL})
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
  String toString() {
    return 'NftState(failure: $failure, isLoading: $isLoading, name: $name, symbol: $symbol, tokenCounter: $tokenCounter, imageURL: $imageURL)';
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
            const DeepCollectionEquality().equals(other.imageURL, imageURL));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(tokenCounter),
      const DeepCollectionEquality().hash(imageURL));

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
      String? imageURL}) = _$_NftState;
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
  @JsonKey(ignore: true)
  _$NftStateCopyWith<_NftState> get copyWith =>
      throw _privateConstructorUsedError;
}
