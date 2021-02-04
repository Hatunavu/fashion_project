import 'dart:async';
import 'dart:developer';

import 'package:suplo_project_8_12_2020/app/blocs/firebase/firebase.auth.dart';

class SignupValidation {
  // var _firAuth = FireAuth();

  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;
  bool validateEmail(email) {
    bool isValidate = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]")
        .hasMatch(email);
    return isValidate;
  }

  bool isValid({String name, String email, String pass, String phone}) {
    // debugger();
    print('email $email');
    bool isEmail = validateEmail(email);
    print('isEMail $isEmail');
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Input email");
      return false;
    }

    if (!isEmail) {
      _emailController.sink.addError("Invalid email");
      return false;
    }
    _emailController.sink.add("");
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Input name");
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Input phone number");
      return false;
    }
    _phoneController.sink.add("");

    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Password must be over 6 characters");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  // void signUp(
  //     {String email,
  //     String pass,
  //     String phone,
  //     String name,
  //     Function onSuccess,
  //     Function(String) onError}) {
  //   // debugger();

  //   _firAuth.signUp(email, pass, name, phone, onSuccess, onError);
  // }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
  }
}
