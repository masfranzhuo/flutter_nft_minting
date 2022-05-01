import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_image_url.dart' as giu;
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart' as mnt;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/contracts.dart';

part 'nft_cubit.freezed.dart';

@singleton
class NFTCubit extends Cubit<NFTState> {
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTokenCounter _getTokenCounter;
  final GetContract _getContract;
  final mnt.Mint _mint;
  final giu.GetImageURL _getImageURL;

  NFTCubit({
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTokenCounter getTokenCounter,
    required GetContract getContract,
    required mnt.Mint mint,
    required giu.GetImageURL getImageURL,
  })  : _getName = getName,
        _getSymbol = getSymbol,
        _getTokenCounter = getTokenCounter,
        _getContract = getContract,
        _mint = mint,
        _getImageURL = getImageURL,
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

  void getContract() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getContract(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (contract) => emit(state.copyWith(isLoading: false, contract: contract)),
    );
  }

  void mint({
    required DeployedContract contract,
    required int tokenCounter,
    required String address,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(mnt.Params(
      contract: contract,
      tokenCounter: tokenCounter,
      address: address,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (success) => emit(state.copyWith(isLoading: false)),
    );
  }

  void getImageURL({
    required DeployedContract contract,
    required int tokenCounter,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getImageURL(giu.Params(
      contract: contract,
      tokenCounter: tokenCounter,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (imageURL) => emit(state.copyWith(isLoading: false, imageURL: imageURL)),
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
    String? imageURL,
    DeployedContract? contract,
  }) = _NFTState;
}
