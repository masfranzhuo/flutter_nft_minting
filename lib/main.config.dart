// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:web3dart/web3dart.dart' as _i5;

import 'core/platform/smart_contract_web3_client.dart' as _i4;
import 'core/utility/injectable_module.injectable.dart' as _i12;
import 'nft/data_sources/nft_data_source.dart' as _i6;
import 'nft/repositories/nft_repository.dart' as _i7;
import 'nft/state_managers/nft_cubit/nft_cubit.dart' as _i11;
import 'nft/use_cases/get_name.dart' as _i8;
import 'nft/use_cases/get_symbol.dart' as _i9;
import 'nft/use_cases/get_token_counter.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.Client>(() => injectableModule.http);
  gh.lazySingleton<_i4.SmartContractWeb3Client>(() =>
      _i4.SmartContractWeb3Client(
          httpClient: get<_i3.Client>(), web3client: get<_i5.Web3Client>()));
  gh.factory<_i5.Web3Client>(() => injectableModule.web3Client);
  gh.lazySingleton<_i6.NFTDataSource>(
      () => _i6.NFTDataSourceImpl(client: get<_i4.SmartContractWeb3Client>()));
  gh.lazySingleton<_i7.NFTRepository>(
      () => _i7.NFTRepositoryImpl(dataSource: get<_i6.NFTDataSource>()));
  gh.lazySingleton<_i8.GetName>(
      () => _i8.GetName(repository: get<_i7.NFTRepository>()));
  gh.lazySingleton<_i9.GetSymbol>(
      () => _i9.GetSymbol(repository: get<_i7.NFTRepository>()));
  gh.lazySingleton<_i10.GetTokenCounter>(
      () => _i10.GetTokenCounter(repository: get<_i7.NFTRepository>()));
  gh.singleton<_i11.NFTCubit>(_i11.NFTCubit(
      getName: get<_i8.GetName>(),
      getSymbol: get<_i9.GetSymbol>(),
      getTokenCounter: get<_i10.GetTokenCounter>()));
  return get;
}

class _$InjectableModule extends _i12.InjectableModule {}
