import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_screen_provider.dart';
import 'package:login_bloc/src/screens/login_screen2.dart';

class App2 extends StatelessWidget {
  const App2({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreenProvider(
      child: const MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          body: LoginScreen2(),
        ),
      ),
    );
  }
}
