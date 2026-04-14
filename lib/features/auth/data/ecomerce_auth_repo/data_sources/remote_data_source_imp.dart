import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/core/utils/app_error.dart';
import 'package:ecomerce_app/core/utils/shared_pref.dart';
import 'package:ecomerce_app/features/auth/data/ecomerce_auth_repo/data_sources/remote_data_source.dart';
import 'package:ecomerce_app/features/network/api_client/api_client.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:ecomerce_app/features/network/model/response/auth_response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImp extends RemoteDataSource {
  final ApiClient _apiClient;
  final SharedPrefUtils _sharedPrefUtils;
  RemoteDataSourceImp(this._apiClient, this._sharedPrefUtils);
  Future<ApiResult<AuthResponse>> login(RemoteLoginRequest loginRequest) async {
    try {
      var response = await _apiClient.login(loginRequest);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefUtils.saveToken(response.data.token!);
        _sharedPrefUtils.saveUser(response.data.user!);
      }
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnKnownError());
    }
  }

  Future<ApiResult<AuthResponse>> register(
    RemoteRegisterRequest registerRequeste,
  ) async {
    try {
      var response = await _apiClient.register(registerRequeste);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefUtils.saveToken(response.data.token!);
        _sharedPrefUtils.saveUser(response.data.user!);
      }
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnKnownError());
    }
  }
}
