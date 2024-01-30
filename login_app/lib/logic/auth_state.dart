import 'package:login_app/data/models/login_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthCodeSentState extends AuthState {}

class AuthLoadedState extends AuthState {
  AuthLoadedState();
}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
