import 'dart:async';

import 'package:login_bloc/src/blocs/validators2.dart';

class LoginScreenBloc with Validators2 {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePwd => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
