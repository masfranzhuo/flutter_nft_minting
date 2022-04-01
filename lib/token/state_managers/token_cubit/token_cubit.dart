import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/entities/token.dart';
import 'package:flutter_token/token/use_cases/get_name.dart';
import 'package:flutter_token/token/use_cases/get_symbol.dart';
import 'package:flutter_token/token/use_cases/get_total_supply.dart';
import 'package:flutter_token/token/use_cases/mint.dart';
import 'package:flutter_token/token/use_cases/burn.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'token_cubit.freezed.dart';

@singleton
class TokenCubit extends Cubit<TokenState> {
  final Mint _mint;
  final Burn _burn;
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTotalSupply _getTotalSupply;

  TokenCubit({
    required Mint mint,
    required Burn burn,
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTotalSupply getTotalSupply,
  })  : _mint = mint,
        _burn = burn,
        _getName = getName,
        _getSymbol = getSymbol,
        _getTotalSupply = getTotalSupply,
        super(TokenState());

  void mint({required int amount}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(amount);
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void burn({required int amount}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _burn(amount);
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void get() async {
    emit(state.copyWith(isLoading: true));

    final name = await _getName(NoParams());
    final symbol = await _getSymbol(NoParams());
    final totalSupply = await _getTotalSupply(NoParams());

    final token = Token(
      name: (name as Right).value,
      symbol: (symbol as Right).value,
      totalSupply: (totalSupply as Right).value,
    );

    emit(state.copyWith(isLoading: false, token: token));
  }
}

@freezed
class TokenState with _$TokenState {
  const TokenState._();
  factory TokenState({
    Failure? failure,
    @Default(false) bool isLoading,
    Token? token,
  }) = _TokenState;
}
