import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_nft_minting/core/error/failure.dart';
import 'package:flutter_nft_minting/core/use_case.dart';
import 'package:flutter_nft_minting/core/utility/get_image_from_json.dart';
import 'package:flutter_nft_minting/nft/data_sources/nft_data_source.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_contract.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_name.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_symbol.dart';
import 'package:flutter_nft_minting/nft/use_cases/get_token_counter.dart';
import 'package:flutter_nft_minting/nft/use_cases/mint.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
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
  final GetIt _getIt;

  NftBloc({
    required GetName getName,
    required GetSymbol getSymbol,
    required GetTokenCounter getTokenCounter,
    required GetContract getContract,
    required Mint mint,
  })  : _getName = getName,
        _getSymbol = getSymbol,
        _getTokenCounter = getTokenCounter,
        _getContract = getContract,
        _mint = mint,
        _getIt = GetIt.instance,
        super(_NftState()) {
    on<_Get>(getEvent);
    on<_GetContract>(getContractEvent);
    on<_Mint>(mintEvent);
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

  Future<void> getContractEvent(
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

  Future<void> mintEvent(
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
      (success) => emit(state.copyWith(isLoading: false)),
    );

    // final eventParams = await _getIt<NFTDataSource>().mintEvent(
    //   contract: event.contract,
    // );
    // await emit.forEach(
    //   eventParams.stream,
    //   onData: (dynamic data) => state.copyWith(
    //     isLoading: false,
    //     imageURL: getImageFromJson(data[3] as String),
    //   ),
    // );
    // eventParams.stream.take(1).listen((event) {
    //   final decoded = eventParams.contractEvent.decodeResults(
    //     event.topics!,
    //     event.data!,
    //   );

    //   for (var element in decoded) {
    //     print(element);
    //   }
    //   if ((decoded[3] as String).contains('.json')) {
    //     print(decoded[3]);
    //     print(getImageFromJson(decoded[3]));
    //     emit(state.copyWith(
    //       isLoading: false,
    //       imageURL: getImageFromJson(decoded[3]),
    //     ));
    //     print(getImageFromJson(decoded[3]));
    //   }
    // });
  }
}
