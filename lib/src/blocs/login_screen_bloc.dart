import 'dart:async';

import 'package:login_bloc/src/blocs/validators2.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreenBloc with Validators2 {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get validateSubmit =>
      CombineLatestStream.combine2(email, password, (a, b) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePwd => _passwordController.sink.add;

  submit() {
    final email = _emailController.value;
    final password = _passwordController.value;

    print("$email and $password is sent to server");
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
