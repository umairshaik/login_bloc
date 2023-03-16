import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (_, __) {
        return true;
      });

  //Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void submit() {
    final email = _emailController.value;
    final password = _passwordController.value;
    print("Email is $email");
    print("Password id $password");
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
