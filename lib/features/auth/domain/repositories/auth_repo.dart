import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';

abstract class AuthRepo {
  Future<ApiResult<void>> login(RemoteLoginRequest remoteLoginRequest);
  Future<ApiResult<void>> register(
    RemoteRegisterRequest remoteRegisterRequest,
  );
}
