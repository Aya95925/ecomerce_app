import 'package:dio/dio.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:ecomerce_app/features/network/model/response/auth_response/auth_response.dart';
import 'package:ecomerce_app/features/network/model/response/category_response/remote_category.dart';
import 'package:ecomerce_app/features/network/model/response/category_response/remote_category_response.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/product_response.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/remote_product.dart';

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
    @Body() RemoteLoginRequest remoteLoginRequest,
  );

  @POST('/api/v1/auth/signup')
  Future<HttpResponse<AuthResponse>> register(
    @Body() RemoteRegisterRequest remoteRegisterRequest,
  );

  @GET('/api/v1/categories')
  Future<HttpResponse<RemoteCategoryResponse>> getAllCategories();

  @GET('/api/v1/products')
  Future<HttpResponse<ProductResponse>> getAllProducts();

  @GET('/api/v1/{categoryId}/subcategories')
  Future<HttpResponse<RemoteCategoryResponse>> getSubCategory(
    @Path() String categoryId,
  );
}
