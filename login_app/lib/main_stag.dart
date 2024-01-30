import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/app_config.dart';
import 'package:login_app/logic/auth_cubit.dart';
import 'package:login_app/logic/auth_state.dart';
import 'package:login_app/presentation/login_page.dart';
import 'package:login_app/utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  AppConfig.create(
    appName: "Login App Stag",
    primaryColor: Colors.yellow,
    flavor: Flavor.stag,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Production',
        theme: ThemeData(
          primarySwatch: AppConfig.shared.primaryColor,
        ),
        home: BlocProvider(
          create: (context) => AuthCubit(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BlocProvider(
                create: (context) => AuthCubit(),
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: SignInScreen(),
                ),
              )),
        ));
  }
}
