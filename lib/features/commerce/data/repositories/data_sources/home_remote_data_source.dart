import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/network/model/response/category_response/remote_category_response.dart';
import 'package:ecomerce_app/features/network/model/response/product_response/product_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<RemoteCategoryResponse>> getAllCategories();

  Future<ApiResult<RemoteCategoryResponse>> getSubCategory(String categoryId);

  Future<ApiResult<ProductResponse>> getAllProducts();
}
