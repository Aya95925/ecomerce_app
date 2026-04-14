import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/core/utils/app_error.dart';
import 'package:ecomerce_app/core/utils/extension/connectivity_extention.dart';
import 'package:ecomerce_app/features/commerce/data/mapper/category_mapper.dart';
import 'package:ecomerce_app/features/commerce/data/mapper/product_mapper.dart';
import 'package:ecomerce_app/features/commerce/data/repositories/data_sources/home_remote_data_source.dart';
import 'package:ecomerce_app/features/commerce/domain/models/category.dart';
import 'package:ecomerce_app/features/commerce/domain/models/product.dart';
import 'package:ecomerce_app/features/commerce/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final Connectivity _connectivity;
  // final  CategoryMapper _categoryMapper;

  HomeRepoImpl(this._homeRemoteDataSource, this._connectivity);

  @override
  Future<ApiResult<List<Category>>> getAllCategories() async {
    if (await _connectivity.isConnected) {
      var apiResult = await _homeRemoteDataSource.getAllCategories();
      if (apiResult.isSuccess) {
        var categoryResponse = apiResult.getData;
        return SuccessApiResult(
          categoryResponse?.category
              ?.map((remoteCategory) => remoteCategory.toCategory())
              .toList(),
        );
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  Future<ApiResult<List<Products>>> getAllProduct() async{
     if (await _connectivity.isConnected) {
      var apiResult = await _homeRemoteDataSource.getAllProducts();
      if (apiResult.isSuccess) {
        var productResponse = apiResult.getData;
        return SuccessApiResult(
          productResponse?.product
              ?.map((remoteCategory) => remoteCategory.toProduct())
              .toList(),
        );
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
  @override
  Future<ApiResult<List<Category>>> getSubCategory( String categoryId) async{
     if (await _connectivity.isConnected) {
      var apiResult = await _homeRemoteDataSource.getSubCategory(categoryId);
      if (apiResult.isSuccess) {
        var categoryResponse = apiResult.getData;
        return SuccessApiResult(
          categoryResponse?.category
              ?.map((remoteCategory) => remoteCategory.toCategory())
              .toList(),
        );
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
  

}
