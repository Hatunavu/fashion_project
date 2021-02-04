import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  //constructor

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    return await _firebaseAuth
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((user) {
      _createUser(
        userId: user.user.uid,
        email: email,
        name: name,
        phone: phone,
      );
    }).catchError((err) {
      print("err signUp: " + err.toString());
    });
  }

  Future<void> _createUser({
    String userId,
    String email,
    String name,
    String phone,
  }) {
    Map<String, dynamic> user = {"email": email, "name": name, "phone": phone};
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    collectionReference
        .doc(userId)
        .set(user)
        .then((value) {})
        .catchError((err) {
      print("err create user: " + err.toString());
    }).whenComplete(() {
      print("completed");
    });
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    return await _firebaseAuth.currentUser != null;
  }

  Future<User> getUser() async {
    return await _firebaseAuth.currentUser;
  }

  void updateUser({
    String email,
    String name,
    String phone,
  }) {
    Map<String, dynamic> data = {'email': email, 'name': name, 'phone': phone};
    User user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('users').doc(user.uid).update(data);
  }
}
