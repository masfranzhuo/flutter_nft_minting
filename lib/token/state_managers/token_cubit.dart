import 'package:bloc/bloc.dart';
import 'package:flutter_token/core/error/failure.dart';
import 'package:flutter_token/core/use_case.dart';
import 'package:flutter_token/token/use_cases/mint.dart';
import 'package:flutter_token/token/use_cases/burn.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'token_cubit.freezed.dart';

@singleton
class TokenCubit extends Cubit<TokenState> {
  final Mint _mint;
  final Burn _burn;

  TokenCubit({
    required Mint mint,
    required Burn burn,
  })  : _mint = mint,
        _burn = burn,
        super(TokenState());

  void mint() async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  void burn() async {
    emit(state.copyWith(isLoading: true));

    final result = await _burn(NoParams());
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
  }) = _TokenState;
}
