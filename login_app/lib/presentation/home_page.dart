import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/data/models/login_model.dart';
import 'package:login_app/logic/auth_cubit.dart';
import 'package:login_app/logic/auth_state.dart';
import 'package:login_app/utils/app_prefs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Response> response = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var userLogin = getUserLogin();
    response = userLogin!.userLoginAPI!.response!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Data"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(response[0].userName),
                  SizedBox(
                    height: 10,
                  ),
                  Text(response[0].firmName),
                  SizedBox(
                    height: 10,
                  ),
                  Text(response[0].address),
                  SizedBox(
                    height: 10,
                  ),
                  Text(response[0].dateOfBirth),
                  SizedBox(
                    height: 10,
                  ),
                  Text(response[0].dateOfAnniversary),
                  SizedBox(
                    height: 10,
                  ),
                  Text(response[0].designation),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
