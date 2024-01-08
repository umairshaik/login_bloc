import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_screen_bloc.dart';

class LoginScreenProvider extends InheritedWidget {
  final LoginScreenBloc bloc = LoginScreenBloc();

  LoginScreenProvider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginScreenBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginScreenProvider>()!.bloc;
}
