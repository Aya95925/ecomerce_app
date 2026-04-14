import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/commerce/domain/models/category.dart';
import 'package:ecomerce_app/features/commerce/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetAllCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<Category>>> call() {
    return _homeRepo.getAllCategories();
  }
}
