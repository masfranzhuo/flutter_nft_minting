import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_image_url.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part 'nft_event.dart';
part 'nft_state.dart';
part 'nft_bloc.freezed.dart';

@singleton
class NftBloc extends Bloc<NftEvent, NftState> {
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTokenCounter _getTokenCounter;
  final Mint _mint;
  final GetImageURL _getImageURL;
  final GetIt _getIt;

  NftBloc({
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTokenCounter getTokenCounter,
    required Mint mint,
    required GetImageURL getImageURL,
  })  : _getName = getName,
        _getSymbol = getSymbol,
        _getTokenCounter = getTokenCounter,
        _mint = mint,
        _getImageURL = getImageURL,
        _getIt = GetIt.instance,
        super(_NftState()) {
    on<_Get>(getEvent);
    on<_Mint>(mintEvent);
    on<_GetImageURL>(getImageURLEvent);
  }

  Future<void> getEvent(
    _Get event,
    Emitter<NftState> emit,
  ) async {
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

  Future<void> mintEvent(
    _Mint event,
    Emitter<NftState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(Params(
      tokenCounter: event.tokenCounter,
      address: event.address,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (success) => emit(state.copyWith(isLoading: false)),
    );

    final tokenCounter = event.tokenCounter;
    final eventParams = await _getIt<NFTDataSource>().mintEvent();
    eventParams.stream.take(1).listen((event) async {
      final decoded = eventParams.contractEvent.decodeResults(
        event.topics!,
        event.data!,
      );

      if((decoded[3] as String).contains('.json')) {
final result = await _getImageURL(tokenCounter);

      result.fold(
        (failure) => emit(state.copyWith(
          failure: failure,
          isLoading: false,
        )),
        (imageURL) => emit(state.copyWith(
          isLoading: false,
          imageURL: imageURL,
        )),
      );
      }
      
    });
  }

  Future<void> getImageURLEvent(
    _GetImageURL event,
    Emitter<NftState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getImageURL(event.tokenCounter);

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (imageURL) => emit(state.copyWith(isLoading: false, imageURL: imageURL)),
    );
  }
}
