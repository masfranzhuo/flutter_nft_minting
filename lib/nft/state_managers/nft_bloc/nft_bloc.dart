import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/core/utility/get_image_from_json.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/contracts.dart';

part 'nft_event.dart';
part 'nft_state.dart';
part 'nft_bloc.freezed.dart';

@singleton
class NftBloc extends Bloc<NftEvent, NftState> {
  final GetName _getName;
  final GetSymbol _getSymbol;
  final GetTokenCounter _getTokenCounter;
  final GetContract _getContract;
  final Mint _mint;
  final MintEvent _mintEvent;

  NftBloc({
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTokenCounter getTokenCounter,
    required GetContract getContract,
    required Mint mint,
    required MintEvent mintEvent,
  })  : _getName = getName,
        _getSymbol = getSymbol,
        _getTokenCounter = getTokenCounter,
        _getContract = getContract,
        _mint = mint,
        _mintEvent = mintEvent,
        super(_NftState()) {
    on<_Get>(getNftEvent);
    on<_GetContract>(getContractNftEvent);
    on<_Mint>(mintNftEvent);
    on<_GetImageURL>(getImageURLNftEvent);
  }

  Future<void> getNftEvent(
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

  Future<void> getContractNftEvent(
    _GetContract event,
    Emitter<NftState> emit,
  ) async {
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

  Future<void> mintNftEvent(
    _Mint event,
    Emitter<NftState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _mint(Params(
      contract: event.contract,
      tokenCounter: event.tokenCounter,
      address: event.address,
    ));

    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        isLoading: false,
      )),
      (success) async {
        emit(state.copyWith(
          isLoading: false,
          isGettingImage: true,
        ));

        final eventParams = await _mintEvent(event.contract);
        (eventParams as Right).value.stream.take(1).listen((data) {
          final decoded =
              (eventParams as Right).value.contractEvent.decodeResults(
                    data.topics!,
                    data.data!,
                  );
          add(NftEvent.getImageURL(imageJson: decoded[3]));
        });
      },
    );
  }

  Future<void> getImageURLNftEvent(
    _GetImageURL event,
    Emitter<NftState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: false,
      isGettingImage: false,
      imageURL: getImageFromJson(event.imageJson),
    ));
  }
}
