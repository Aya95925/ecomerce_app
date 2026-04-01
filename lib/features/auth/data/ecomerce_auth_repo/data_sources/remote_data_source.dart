import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:ecomerce_app/features/network/model/response/auth_response/auth_response.dart';

abstract class RemoteDataSource {
  Future<ApiResult<AuthResponse>> login(RemoteLoginRequest loginRequest);
  Future<ApiResult<AuthResponse>> register(
    RemoteRegisterRequest registerRequeste,
  );
}
