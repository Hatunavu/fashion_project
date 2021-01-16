import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/firebase/firebase.auth.dart';

class InforWidget extends StatefulWidget {
  @override
  _InforWidgetState createState() => _InforWidgetState();
}

class _InforWidgetState extends State<InforWidget> {
  TextEditingController emailController;
  TextEditingController nameController;
  TextEditingController phoneController;
  bool showPass = false;
  FireAuth fireAuth = FireAuth();
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User user = FirebaseAuth.instance.currentUser;
  final _scaffolKey = GlobalKey<ScaffoldState>();

  DocumentSnapshot document;

  void fetchData() async {
    await users.doc(user.uid).get().then((value) {
      document = value;

      nameController.text = document.data()['name'];
      emailController.text = document.data()['email'];
      phoneController.text = document.data()['phone'];
    });
  }

  Widget inforEmail() {
    emailController = TextEditingController();
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF86744e),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.mail,
            color: Color(0xFF86744e),
          ),
        ),
      ),
    );
  }

  Widget inforName() {
    nameController = TextEditingController();
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        controller: nameController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF86744e),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.account_box,
            color: Color(0xFF86744e),
          ),
        ),
      ),
    );
  }

  Widget inforPhone() {
    phoneController = TextEditingController();
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF86744e),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.phone,
            color: Color(0xFF86744e),
          ),
        ),
      ),
    );
  }

  Widget passCard(
    String text,
    IconData icon,
  ) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            // controller: controller,
            obscureText: !showPass,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color(0xFF86744e),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                icon,
                color: Color(0xFF86744e),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: GestureDetector(
              onTap: onToggleShowPass,
              child: Text(
                showPass ? 'HIDE' : 'SHOW',
                style: TextStyle(
                    color: Color(0xFF86744e),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }

  Widget buildUpdateBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onUpdateClick,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF86744e),
        child: Text(
          'Cập nhật thông tin',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void onUpdateClick() {
    auth.currentUser.updateEmail(emailController.text);

    fireAuth.updateUser(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
    );
    _scaffolKey.currentState.showSnackBar(SnackBar(
      content: Text('Cập nhật thành công'),
      backgroundColor: Color(0xFF86744e),
      duration: Duration(seconds: 1),
    ));
  }

  void onToggleShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
        key: _scaffolKey,
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          title: Text('Thông tin tài khoản',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inforEmail(),
            inforName(),
            inforPhone(),
            buildUpdateBtn(),
          ],
        ));
  }
}
