import 'dart:async';

import 'package:async/async.dart';
import 'package:suplo_project_8_12_2020/app/blocs/firebase/firebase.auth.dart';

class LoginBloc {
  var _fireAuth = FireAuth();

  StreamController _emailController = StreamController();
  StreamController _passController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool validateEmail(email) {
    bool isValidate = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]")
        .hasMatch(email);
    return isValidate;
  }

  bool isValid(String email, String pass) {
    bool isEmail = validateEmail(email);
    if (email == null || email.length == 0) {
      _emailController.sink.addError('Input email');
      return false;
    }
    if (!isEmail) {
      _emailController.sink.addError("Invalid email");
      return false;
    }
    _emailController.sink.add('');
    if (pass == null || pass.length == 0) {
      _passController.sink.addError('Input password');
      return false;
    }
    _passController.sink.add('');
    return true;
  }

  Future<Result> signIn(
      {String email,
      String pass,
      Function onSuccess,
      Function(String) onError}) {
    return _fireAuth.signIn(email, pass, onSuccess, onError);
  }

  void dispose() {
    _emailController.close();
    _passController.close();
  }
}
