import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'nft_cubit.freezed.dart';

@singleton
class NFTCubit extends Cubit<NFTState> {
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTokenCounter _getTokenCounter;
  final Mint _mint;

  NFTCubit({
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTokenCounter getTokenCounter,
    required Mint mint,
  })  : _getName = getName,
        _getSymbol = getSymbol,
        _getTokenCounter = getTokenCounter,
        _mint = mint,
        super(NFTState());

  void get() async {
    emit(state.copyWith(isLoading: true));

    final name = await _getName(NoParams());
    final symbol = await _getSymbol(NoParams());
    final tokenCounter = await _getTokenCounter(NoParams());

    emit(state.copyWith(
      isLoading: false,
      name: (name as Right).value,
      symbol: (symbol as Right).value,
      tokenCounter: (tokenCounter as Right).value,
    ));
  }

  void mint({
    required int tokenCounter,
    required String address,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(Params(
      tokenCounter: tokenCounter,
      address: address,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (imageUrl) => emit(state.copyWith(
        isLoading: false,
        imageUrl: imageUrl,
      )),
    );
  }
}

@freezed
class NFTState with _$NFTState {
  const NFTState._();
  factory NFTState({
    Failure? failure,
    @Default(false) bool isLoading,
    String? name,
    String? symbol,
    @Default(0) int tokenCounter,
    String? imageUrl,
  }) = _NFTState;
}
