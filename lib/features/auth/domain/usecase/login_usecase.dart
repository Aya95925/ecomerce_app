import 'package:ecomerce_app/core/utils/api_result.dart';
import 'package:ecomerce_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepo _authRepo;
  LoginUsecase(this._authRepo);
  Future<ApiResult<void>> call(RemoteLoginRequest request) {
    return _authRepo.login(request);
  }
}
