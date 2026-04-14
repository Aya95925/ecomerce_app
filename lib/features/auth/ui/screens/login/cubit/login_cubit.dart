import 'package:ecomerce_app/core/utils/resources.dart';
import 'package:ecomerce_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:ecomerce_app/features/auth/ui/screens/login/cubit/login_state.dart';
import 'package:ecomerce_app/features/network/model/request/remote_login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginState.initial());
  final LoginUsecase _loginUsecase;
  void login(String email, String password) async {
    emit(LoginState(Resources.isLoading()));
    var result = await _loginUsecase(
      RemoteLoginRequest(email: email, password: password),
    );
    if (result.isSuccess) {
      emit(LoginState(Resources.isSuucess(null)));
    } else {
      emit(LoginState(Resources.isError(result.getError!.errorMessage)));
    }
  }
}
