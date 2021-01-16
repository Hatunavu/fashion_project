import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/firebase/firebase.auth.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/header.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/menu.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/login.widget.dart';

class AccountWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot document;
  String name;
  String phone;
  FireAuth fireAuth = FireAuth();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  void fetchData() async {
    // debugger();
    await users.doc(user.uid).get().then((value) {
      document = value;
      if (mounted) {
        setState(() {
          name = document.data()['name'];
          phone = document.data()['phone'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAccount(
              name: name,
              phone: phone,
            ),
            MenuAccount(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  _onLogoutClick(context);
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: Text(
                    'Đăng xuất',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onLogoutClick(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Đăng xuất'),
            content: Text('Bạn có chắc muốn đăng xuất không?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Hủy')),
              FlatButton(
                  onPressed: () {
                    fireAuth.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginWidget()));
                  },
                  child: Text('Xác nhận'))
            ],
          );
        });
  }
}
