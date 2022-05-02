part of 'nft_bloc.dart';

@freezed
class NftEvent with _$NftEvent {
  const factory NftEvent.get() = _Get;
  const factory NftEvent.getContract() = _GetContract;
  const factory NftEvent.mint({
    required DeployedContract contract,
    required int tokenCounter,
    required String address,
  }) = _Mint;
  const factory NftEvent.getImageURL({
    required String imageJson,
  }) = _GetImageURL;
}
