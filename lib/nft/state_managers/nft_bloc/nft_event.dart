part of 'nft_bloc.dart';

@freezed
class NftEvent with _$NftEvent {
  const factory NftEvent.get() = _Get;
  const factory NftEvent.mint({
    required int tokenCounter,
    required String address,
  }) = _Mint;
  const factory NftEvent.getImageUrl({
    required int tokenCounter,
  }) = _GetImageURL;
}
