// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:web3dart/web3dart.dart' as _i5;

import 'core/platform/smart_contract_web3_client.dart' as _i4;
import 'core/utility/injectable_module.injectable.dart' as _i15;
import 'token/data_sources/token_data_source.dart' as _i6;
import 'token/repositories/token_repository.dart' as _i7;
import 'token/state_managers/token_cubit/token_cubit.dart' as _i14;
import 'token/use_cases/burn.dart' as _i9;
import 'token/use_cases/get_name.dart' as _i10;
import 'token/use_cases/get_symbol.dart' as _i11;
import 'token/use_cases/get_total_supply.dart' as _i12;
import 'token/use_cases/mint.dart' as _i13;
import 'token/use_cases/transfer.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.TokenDataSource>(() =>
      _i6.TokenDataSourceImpl(client: get<_i4.SmartContractWeb3Client>()));
  gh.lazySingleton<_i7.TokenRepository>(
      () => _i7.TokenRepositoryImpl(dataSource: get<_i6.TokenDataSource>()));
  gh.factory<_i8.Transfer>(
      () => _i8.Transfer(repository: get<_i7.TokenRepository>()));
  gh.factory<_i5.Web3Client>(() => injectableModule.web3Client);
  gh.factory<_i9.Burn>(() => _i9.Burn(repository: get<_i7.TokenRepository>()));
  gh.lazySingleton<_i10.GetName>(
      () => _i10.GetName(repository: get<_i7.TokenRepository>()));
  gh.lazySingleton<_i11.GetSymbol>(
      () => _i11.GetSymbol(repository: get<_i7.TokenRepository>()));
  gh.lazySingleton<_i12.GetTotalSupply>(
      () => _i12.GetTotalSupply(repository: get<_i7.TokenRepository>()));
  gh.factory<_i13.Mint>(
      () => _i13.Mint(repository: get<_i7.TokenRepository>()));
  gh.singleton<_i14.TokenCubit>(_i14.TokenCubit(
      mint: get<_i13.Mint>(),
      burn: get<_i9.Burn>(),
      transfer: get<_i8.Transfer>(),
      getName: get<_i10.GetName>(),
      getSymbol: get<_i11.GetSymbol>(),
      getTotalSupply: get<_i12.GetTotalSupply>()));
  return get;
}

class _$InjectableModule extends _i15.InjectableModule {}
