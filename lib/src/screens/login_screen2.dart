import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_screen_bloc.dart';

class LoginScreen2 extends StatelessWidget {
  LoginScreen2({super.key});

  final bloc = LoginScreenBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          const Padding(padding: EdgeInsets.all(10.0)),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(LoginScreenBloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'your@email.com',
              labelText: 'Email address',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(LoginScreenBloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePwd,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Login Button',
        ));
  }
}
