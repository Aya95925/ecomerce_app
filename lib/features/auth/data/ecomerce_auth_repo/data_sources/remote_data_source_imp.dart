import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/core/utils/app_error.dart';
import 'package:ecomerce_app/features/network/api_client/api_client.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:ecomerce_app/features/network/model/response/auth_response/auth_response.dart';

class RemoteDataSourceImp {
  final ApiClient _apiClient;
  RemoteDataSourceImp(this._apiClient);
  Future<ApiResult<AuthResponse>> login(RemoteLoginRequest loginRequest) async {
    try {
      var response = await _apiClient.login(loginRequest);
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnKnownError());
    }
  }

  Future<ApiResult<AuthResponse>> register  (
    RemoteRegisterRequest registerRequeste,
  ) async{
      try {
      var response = await _apiClient.register(registerRequeste);
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnKnownError());
    }
  }
}
