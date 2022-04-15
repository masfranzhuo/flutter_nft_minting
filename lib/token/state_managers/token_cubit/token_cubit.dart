import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/entities/staking_summary.dart';
import 'package:flutter_token/token/entities/token.dart';
import 'package:flutter_token/token/use_cases/get_name.dart';
import 'package:flutter_token/token/use_cases/get_staking_summary.dart' as gss;
import 'package:flutter_token/token/use_cases/get_symbol.dart';
import 'package:flutter_token/token/use_cases/get_total_supply.dart';
import 'package:flutter_token/token/use_cases/mint.dart' as mnt;
import 'package:flutter_token/token/use_cases/burn.dart' as brn;
import 'package:flutter_token/token/use_cases/stake_token.dart' as st;
import 'package:flutter_token/token/use_cases/transfer.dart' as trf;
import 'package:flutter_token/token/use_cases/withdraw_stake.dart' as wds;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'token_cubit.freezed.dart';

@singleton
class TokenCubit extends Cubit<TokenState> {
  final mnt.Mint _mint;
  final brn.Burn _burn;
  final trf.Transfer _transfer;
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTotalSupply _getTotalSupply;
  final gss.GetStakingSummary _getStakingSummary;
  final st.StakeToken _stakeToken;
  final wds.WithdrawStake _withdrawStake;

  TokenCubit({
    required mnt.Mint mint,
    required brn.Burn burn,
    required trf.Transfer transfer,
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTotalSupply getTotalSupply,
    required gss.GetStakingSummary getStakingSummary,
    required st.StakeToken stakeToken,
    required wds.WithdrawStake withdrawStake,
  })  : _mint = mint,
        _burn = burn,
        _transfer = transfer,
        _getName = getName,
        _getSymbol = getSymbol,
        _getTotalSupply = getTotalSupply,
        _getStakingSummary = getStakingSummary,
        _stakeToken = stakeToken,
        _withdrawStake = withdrawStake,
        super(TokenState());

  void mint({required int amount, String? address}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(mnt.Params(
      amount: amount,
      address: address,
    ));
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void burn({required int amount, String? address}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _burn(brn.Params(
      amount: amount,
      address: address,
    ));
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void transfer({required String addressHexString, required int amount}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _transfer(trf.Params(
      addressHexString: addressHexString,
      amount: amount,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void get({String? address}) async {
    emit(state.copyWith(isLoading: true));

    final name = await _getName(NoParams());
    final symbol = await _getSymbol(NoParams());
    final totalSupply = await _getTotalSupply(NoParams());

    final token = Token(
      name: (name as Right).value,
      symbol: (symbol as Right).value,
      totalSupply: (totalSupply as Right).value,
    );

    if (address != null) {
      final result = await _getStakingSummary(
        gss.Params(address: address),
      );

      result.fold(
        (failure) => emit(state.copyWith(
          failure: failure,
          isLoading: false,
          token: token,
        )),
        (stakingSummary) => emit(state.copyWith(
          isLoading: false,
          token: token,
          stakingSummary: stakingSummary,
        )),
      );
    } else {
      emit(state.copyWith(isLoading: false, token: token));
    }
  }

  void stakeToken({required int amount}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _stakeToken(st.Params(amount: amount));
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void withdrawStake({required int amount, required int index}) async {
    emit(state.copyWith(isLoading: true));

    final result = await _withdrawStake(wds.Params(
      amount: amount,
      index: index,
    ));
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }
}

@freezed
class TokenState with _$TokenState {
  const TokenState._();
  factory TokenState({
    Failure? failure,
    @Default(false) bool isLoading,
    Token? token,
    StakingSummary? stakingSummary,
  }) = _TokenState;
}
