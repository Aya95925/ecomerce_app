import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/commerce/domain/models/product.dart';
import 'package:ecomerce_app/features/commerce/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllProductUseCase {
  final HomeRepo _homeRepo;

  GetAllProductUseCase(this._homeRepo);
  Future<ApiResult<List<Products>>> call() => _homeRepo.getAllProduct();
}
