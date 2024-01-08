import 'dart:async';

class Validators2 {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    // Regular expression for email validation
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    if (email.isEmpty) {
      sink.addError('not a valid email');
    } else if (!RegExp(emailPattern).hasMatch(email)) {
      sink.addError('invalid email');
    } else {
      sink.add(email);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    String passwordPattern =
        r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}\[\]:;<>,./?]).{8,}$';
    if (password.isEmpty) {
      sink.addError('Empty password');
    } else if (password.length < 8) {
      sink.addError('Password must be at least 8 characters');
    } else if (!RegExp(passwordPattern).hasMatch(password)) {
      sink.addError(
          'Password must contain \nat least one special character \nand one digit');
    } else {
      sink.add(password);
    }
  });
}
