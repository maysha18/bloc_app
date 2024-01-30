import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/data/models/login_model.dart';
import 'package:login_app/data/repositories/login_repository.dart';
import 'package:login_app/logic/auth_state.dart';
import 'package:login_app/utils/app_prefs.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  AuthRepository postRepository = AuthRepository();

  Future<void> loginUser({String captcha = "", String otp = ""}) async {
    emit(AuthLoadingState());
    Map<String, dynamic> data = {
      "MobileNo": "9900000000",
      "DeviceId": "Device001",
      "OSType": "iOS",
      "CaptchaCode": captcha,
      "OTP": otp,
      "IsLoginFirst": "",
      "FCMToken": ""
    };
    try {
      LoginModel user = await postRepository.loginUser(data);
      await saveUserLogin(user);
      emit(AuthLoadedState());
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.connectionError) {
        emit(AuthErrorState(
            "Can't fetch posts, please check your internet connection!"));
      } else {
        emit(AuthErrorState(ex.type.toString()));
      }
    }
  }

  Future<void> verifyOTP({String otp = "", String captcha = ""}) async {
    emit(AuthLoadingState());

    await loginUser(captcha: captcha, otp: otp);
  }
}
