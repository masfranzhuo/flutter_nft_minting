// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:web3dart/web3dart.dart' as _i5;

import 'core/platform/smart_contract_web3_client.dart' as _i4;
import 'core/utility/injectable_module.dart' as _i11;
import 'counter/data_sources/counter_data_source.dart' as _i6;
import 'counter/repositories/counter_repository.dart' as _i7;
import 'counter/state_managers/counter_cubit/counter_cubit.dart' as _i10;
import 'counter/use_cases/get_counter.dart' as _i8;
import 'counter/use_cases/increment_counter.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.CounterDataSource>(() =>
      _i6.CounterDataSourceImpl(client: get<_i4.SmartContractWeb3Client>()));
  gh.lazySingleton<_i7.CounterRepository>(() =>
      _i7.CounterRepositoryImpl(dataSource: get<_i6.CounterDataSource>()));
  gh.lazySingleton<_i8.GetCounter>(
      () => _i8.GetCounter(repository: get<_i7.CounterRepository>()));
  gh.factory<_i9.IncrementCounter>(
      () => _i9.IncrementCounter(repository: get<_i7.CounterRepository>()));
  gh.singleton<_i10.CounterCubit>(_i10.CounterCubit(
      getCounter: get<_i8.GetCounter>(),
      incrementCounter: get<_i9.IncrementCounter>()));
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
