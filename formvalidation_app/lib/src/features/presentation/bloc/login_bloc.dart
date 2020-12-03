import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:formvalidation_app/src/features/presentation/bloc/validators.dart';

class LoginBloc with Validators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;

  set email(value) {
    _emailController.value = value;
  }

  String get password => _passwordController.value;

  set password(value) {
    _passwordController.value = value;
  }

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
