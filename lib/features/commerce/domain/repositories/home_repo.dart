import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/commerce/domain/models/category.dart';
import 'package:ecomerce_app/features/commerce/domain/models/product.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>> getAllCategories();
  Future<ApiResult<List<Products>>> getAllProduct();
  Future<ApiResult<List<Category>>> getSubCategory(String categoryId);
}
