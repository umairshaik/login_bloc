import 'dart:async';

import 'package:login_bloc/src/blocs/validators2.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreenBloc with Validators2 {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (_, __) {
        return true;
      });

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePwd => _password.sink.add;

  submit() {
    final email = _email.value;
    final password = _password.value;

    print("$email and $password is sent to server");
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
