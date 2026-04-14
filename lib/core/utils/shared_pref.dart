import 'dart:convert';

import 'package:ecomerce_app/features/network/model/response/auth_response/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefUtils {
  final SharedPreferences sharedPreferences;

  SharedPrefUtils(this.sharedPreferences);

  Future<void> saveUser(User user) async {
    var json = user.toJson();
    await sharedPreferences.setString("user", jsonEncode(json));
  }

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  Future<User?> getUser() async {
    String? userString = sharedPreferences.getString('user');
    if (userString == null) return null;

    Map<String, dynamic> json = jsonDecode(userString);
    return User.fromJson(json);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString('token');
  }
}
