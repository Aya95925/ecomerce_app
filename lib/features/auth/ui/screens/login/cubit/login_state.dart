import 'package:ecomerce_app/core/utils/resources.dart';

class LoginState {
  late Resources apiLogin;
  LoginState(this.apiLogin);
  LoginState.initial() {
    apiLogin = Resources.initials();
  }
}
