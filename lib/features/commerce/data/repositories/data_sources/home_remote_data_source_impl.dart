import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/core/utils/app_error.dart';
import 'package:ecomerce_app/features/commerce/data/repositories/data_sources/home_remote_data_source.dart';
import 'package:ecomerce_app/features/network/api_client/api_client.dart';
import 'package:ecomerce_app/features/network/model/response/category_response/remote_category_response.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/product_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<RemoteCategoryResponse>> getAllCategories() async {
    try {
      var response = await _apiClient.getAllCategories();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  Future<ApiResult<RemoteCategoryResponse>> getSubCategory(String categoryId) async {
    try {
      var response = await _apiClient.getAllCategories();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  Future<ApiResult<ProductResponse>> getAllProducts() async {
    try {
      var response = await _apiClient.getAllProducts();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
}
