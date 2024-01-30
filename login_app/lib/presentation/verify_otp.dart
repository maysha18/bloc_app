import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/data/models/login_model.dart';
import 'package:login_app/logic/auth_cubit.dart';
import 'package:login_app/logic/auth_state.dart';
import 'package:login_app/presentation/home_page.dart';
import 'package:login_app/utils/app_prefs.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  VerifyPhoneNumberScreen({
    super.key,
  });
  TextEditingController otpController = TextEditingController();
  TextEditingController captchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var response = getUserLogin();
    var userData = response!.userLoginAPI!.response!;
    otpController.text = userData[0].oTPCode;
    captchaController.text = userData[0].captchaCode;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Phone Number"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: otpController,
                    maxLength: 6,
                    decoration: InputDecoration(
                        labelText: "otp",
                        border: OutlineInputBorder(),
                        hintText: "6-Digit OTP",
                        counterText: ""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: captchaController,
                    maxLength: 6,
                    decoration: InputDecoration(
                        labelText: "captcha",
                        border: OutlineInputBorder(),
                        hintText: "6-Digit OTP",
                        counterText: ""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoadedState) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomeScreen()));
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                          duration: Duration(milliseconds: 2000),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).verifyOTP(
                                captcha: captchaController.text,
                                otp: otpController.text);
                          },
                          color: Colors.blue,
                          child: Text("Verify"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
