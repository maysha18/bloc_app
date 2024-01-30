import 'dart:convert';
import 'package:login_app/data/models/login_model.dart';
import 'package:login_app/utils/storage.dart';

const String loginData = "LoginData";

Future<bool> saveUserLogin(LoginModel value) async {
  var encode = jsonEncode(value);
  await StorageUtil.putString(loginData, encode);
  return Future.value(true);
}

LoginModel? getUserLogin() {
  String? read = StorageUtil.getString(loginData);
  if (read.isNotEmpty) {
    LoginModel model = LoginModel.fromJson(jsonDecode(read));
    return model;
  }
  return null;
}
