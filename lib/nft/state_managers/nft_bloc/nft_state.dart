part of 'nft_bloc.dart';

@freezed
class NftState with _$NftState {
  const NftState._();
  factory NftState({
    Failure? failure,
    @Default(false) bool isLoading,
    String? name,
    String? symbol,
    @Default(0) int tokenCounter,
    String? imageURL,
    DeployedContract? contract,
  }) = _NftState;
}
