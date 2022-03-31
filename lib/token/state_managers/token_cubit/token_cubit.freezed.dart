// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TokenStateTearOff {
  const _$TokenStateTearOff();

  _TokenState call({Failure? failure, bool isLoading = false, Token? token}) {
    return _TokenState(
      failure: failure,
      isLoading: isLoading,
      token: token,
    );
  }
}

/// @nodoc
const $TokenState = _$TokenStateTearOff();

/// @nodoc
mixin _$TokenState {
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Token? get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenStateCopyWith<TokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenStateCopyWith<$Res> {
  factory $TokenStateCopyWith(
          TokenState value, $Res Function(TokenState) then) =
      _$TokenStateCopyWithImpl<$Res>;
  $Res call({Failure? failure, bool isLoading, Token? token});

  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class _$TokenStateCopyWithImpl<$Res> implements $TokenStateCopyWith<$Res> {
  _$TokenStateCopyWithImpl(this._value, this._then);

  final TokenState _value;
  // ignore: unused_field
  final $Res Function(TokenState) _then;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? token = freezed,
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
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
    ));
  }

  @override
  $TokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc
abstract class _$TokenStateCopyWith<$Res> implements $TokenStateCopyWith<$Res> {
  factory _$TokenStateCopyWith(
          _TokenState value, $Res Function(_TokenState) then) =
      __$TokenStateCopyWithImpl<$Res>;
  @override
  $Res call({Failure? failure, bool isLoading, Token? token});

  @override
  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class __$TokenStateCopyWithImpl<$Res> extends _$TokenStateCopyWithImpl<$Res>
    implements _$TokenStateCopyWith<$Res> {
  __$TokenStateCopyWithImpl(
      _TokenState _value, $Res Function(_TokenState) _then)
      : super(_value, (v) => _then(v as _TokenState));

  @override
  _TokenState get _value => super._value as _TokenState;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isLoading = freezed,
    Object? token = freezed,
  }) {
    return _then(_TokenState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
    ));
  }
}

/// @nodoc

class _$_TokenState extends _TokenState {
  _$_TokenState({this.failure, this.isLoading = false, this.token}) : super._();

  @override
  final Failure? failure;
  @JsonKey()
  @override
  final bool isLoading;
  @override
  final Token? token;

  @override
  String toString() {
    return 'TokenState(failure: $failure, isLoading: $isLoading, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenState &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$TokenStateCopyWith<_TokenState> get copyWith =>
      __$TokenStateCopyWithImpl<_TokenState>(this, _$identity);
}

abstract class _TokenState extends TokenState {
  factory _TokenState({Failure? failure, bool isLoading, Token? token}) =
      _$_TokenState;
  _TokenState._() : super._();

  @override
  Failure? get failure;
  @override
  bool get isLoading;
  @override
  Token? get token;
  @override
  @JsonKey(ignore: true)
  _$TokenStateCopyWith<_TokenState> get copyWith =>
      throw _privateConstructorUsedError;
}
