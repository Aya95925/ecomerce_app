// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/ecomerce_auth_repo/auth_repo_impl.dart'
    as _i44;
import '../../features/auth/data/ecomerce_auth_repo/data_sources/remote_data_source.dart'
    as _i497;
import '../../features/auth/data/ecomerce_auth_repo/data_sources/remote_data_source_imp.dart'
    as _i851;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/register_usecase.dart' as _i769;
import '../../features/auth/ui/screens/login/cubit/login_cubit.dart' as _i413;
import '../../features/network/api_client/api_client.dart' as _i652;
import '../utils/shared_pref.dart' as _i979;
import 'git_it_module.dart' as _i710;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => gitItModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i895.Connectivity>(() => gitItModule.createConnectivity());
    gh.singleton<_i361.Dio>(() => gitItModule.createDio());
    gh.factory<_i979.SharedPrefUtils>(
      () => _i979.SharedPrefUtils(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i652.ApiClient>(() => _i652.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i497.RemoteDataSource>(
      () => _i851.RemoteDataSourceImp(
        gh<_i652.ApiClient>(),
        gh<_i979.SharedPrefUtils>(),
      ),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i44.AuthRepoImpl(
        gh<_i895.Connectivity>(),
        gh<_i497.RemoteDataSource>(),
      ),
    );
    gh.factory<_i911.LoginUsecase>(
      () => _i911.LoginUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i769.RegisterUsecase>(
      () => _i769.RegisterUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i413.LoginCubit>(
      () => _i413.LoginCubit(gh<_i911.LoginUsecase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i710.GitItModule {}
