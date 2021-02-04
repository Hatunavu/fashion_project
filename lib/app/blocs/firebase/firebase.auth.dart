import 'dart:developer';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(
          userId: user.user.uid,
          email: email,
          name: name,
          phone: phone,
          onSuccess: onSuccess,
          onRegisterError: onRegisterError);
    }).catchError((err) {
      print("err signUp: " + err.toString());
      _onSignUpErr(err.code, onRegisterError);
    });
  }

  Future<Result<UserCredential>> signIn(String email, String pass,
      Function onSuccess, Function(String) onSignInError) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      // onSuccess();
      return Result.value(userCredential);
    } on FirebaseAuthException catch (e) {
      // _onSignInErr(e.code, onSignInError);
      return Result.error(e.code);
    }
  }

  Future<void> _createUser(
      {String userId,
      String email,
      String name,
      String phone,
      Function onSuccess,
      Function(String) onRegisterError}) {
    //add to cloud firstore
    Map<String, dynamic> user = {"email": email, "name": name, "phone": phone};
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    collectionReference.doc(userId).set(user).then((value) {
      onSuccess();
    }).catchError((err) {
      print("err create user: " + err.toString());
      onRegisterError("SignUp fail, please try again");
    }).whenComplete(() {
      print("completed");
    });
  }

  ///
  void _onSignUpErr(String code, Function(String) onRegisterError) {
    print('code sign up: ' + code);
    switch (code) {
      case "email-already-in-use":
        onRegisterError("Email has existed");
        break;

      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }

  void _onSignInErr(String code, Function(String) onSignInError) {
    print('code sign in: ' + code);
    switch (code) {
      case 'user-not-found':
        onSignInError('Email or password is incorrect');
        break;
      case 'wrong-password':
        onSignInError('Email or password is incorrect');
        break;
      default:
        onSignInError("SignUp fail, please try again");
        break;
    }
  }

  void updateUser(
      {String email,
      String name,
      String phone,
      Function onSuccess,
      Function(String) onRegisterError}) {
    Map<String, dynamic> data = {'email': email, 'name': name, 'phone': phone};
    User user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('users').doc(user.uid).update(data);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
