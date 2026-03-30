

import 'package:dio/dio.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/response/auth_response/auth_response.dart';
import 'package:ecomerce_app/features/network/model/response/remote_register_request.dart';
import 'package:injectable/injectable.dart';
// import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';


@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
@POST('/api/v1/auth/signin')
Future<HttpResponse<AuthResponse>> login(
  @Body() RemoteLoginRequest remoteLoginRequest
);
@POST('/api/v1/auth/signup')
Future<HttpResponse<AuthResponse>> register(
  @Body() RemoteRegisterRequest remoteRegisterRequest
);
}
