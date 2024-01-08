import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_screen_bloc.dart';
import 'package:login_bloc/src/blocs/login_screen_provider.dart';

class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: const Column(
        children: [
          EmailFieldWidget(),
          PasswordFieldWidget(),
          Padding(padding: EdgeInsets.all(10.0)),
          SubmitButton()
        ],
      ),
    );
  }
}

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenBloc bloc = LoginScreenProvider.of(context);
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
}

class PasswordFieldWidget extends StatelessWidget {
  const PasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenBloc bloc = LoginScreenProvider.of(context);
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
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenBloc bloc = LoginScreenProvider.of(context);
    return StreamBuilder(
        stream: bloc.validateSubmit,
        builder: (context, snapshot) {
          print('error ${snapshot.hasError}');
          print('has data ${snapshot.hasData}');
          return ElevatedButton(
              onPressed: snapshot.hasData ? bloc.submit : null,
              child: const Text(
                'Login Button',
              ));
        });
  }
}
