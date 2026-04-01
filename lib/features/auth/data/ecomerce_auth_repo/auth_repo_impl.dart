import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/core/utils/app_error.dart';
import 'package:ecomerce_app/core/utils/extension/connectivity_extention.dart';
import 'package:ecomerce_app/features/auth/data/ecomerce_auth_repo/data_sources/remote_data_source.dart';
import 'package:ecomerce_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoImpl)
class AuthRepoImpl extends AuthRepo {
  final Connectivity _connectivity;
  final RemoteDataSource _remoteDataSource;
  AuthRepoImpl(this._connectivity, this._remoteDataSource);
  @override
  Future<ApiResult<void>> login(RemoteLoginRequest remoteLoginRequest) async {
    if (await _connectivity.isConnected) {
      return _remoteDataSource.login(remoteLoginRequest);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<void>> register(
    RemoteRegisterRequest remoteRegisterRequest,
  )async {
      if (await _connectivity.isConnected) {
      return _remoteDataSource.register(remoteRegisterRequest);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}
