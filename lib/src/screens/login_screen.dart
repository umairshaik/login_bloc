import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(children: [
        emailField(bloc),
        passwordField(bloc),
        submitButton(),
      ]),
    );
  }

  Widget emailField(Bloc block) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "you@example.com",
              errorText: snapshot.error?.toString()),
          onChanged: block.changeEmail,
        );
      },
      stream: block.email,
    );
  }

  Widget passwordField(Bloc block) {
    return StreamBuilder(
      stream: block.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              hintText: "Password",
              errorText: snapshot.error?.toString()),
          onChanged: block.changePassword,
        );
      },
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Login"),
      ),
    );
  }
}
