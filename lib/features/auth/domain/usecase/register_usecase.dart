import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:ecomerce_app/features/network/model/request/remote_register_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepo _authRepo;
  LoginUsecase(this._authRepo);
  Future<ApiResult<void>> call(RemoteRegisterRequest request) {
    return _authRepo.register(request);
  }
}
