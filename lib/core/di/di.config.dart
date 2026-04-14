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
import '../../features/commerce/data/repositories/data_sources/home_remote_data_source.dart'
    as _i880;
import '../../features/commerce/data/repositories/data_sources/home_remote_data_source_impl.dart'
    as _i1073;
import '../../features/commerce/data/repositories/home_repo_impl.dart'
    as _i1028;
import '../../features/commerce/domain/repositories/home_repo.dart' as _i972;
import '../../features/commerce/domain/usecases/get_category_use_case.dart'
    as _i466;
import '../../features/commerce/domain/usecases/get_product_use_case.dart'
    as _i316;
import '../../features/commerce/domain/usecases/get_sub_category_use_case.dart'
    as _i589;
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
    gh.factory<_i880.HomeRemoteDataSource>(
      () => _i1073.HomeRemoteDataSourceImpl(gh<_i652.ApiClient>()),
    );
    gh.factory<_i972.HomeRepo>(
      () => _i1028.HomeRepoImpl(
        gh<_i880.HomeRemoteDataSource>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.factory<_i911.LoginUsecase>(
      () => _i911.LoginUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i769.RegisterUsecase>(
      () => _i769.RegisterUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i466.GetAllCategoriesUseCase>(
      () => _i466.GetAllCategoriesUseCase(gh<_i972.HomeRepo>()),
    );
    gh.factory<_i316.GetAllProductUseCase>(
      () => _i316.GetAllProductUseCase(gh<_i972.HomeRepo>()),
    );
    gh.factory<_i589.GetSubCategoryUseCase>(
      () => _i589.GetSubCategoryUseCase(gh<_i972.HomeRepo>()),
    );
    gh.factory<_i413.LoginCubit>(
      () => _i413.LoginCubit(gh<_i911.LoginUsecase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i710.GitItModule {}
