import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.event.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      body:
          // SingleChildScrollView(
          //   child:
          FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final DocumentSnapshot documents = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderAccount(
                          name: documents['name'],
                          phone: documents['phone'],
                        ),
                        MenuAccount(),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(AuthenticationEventLoggedOut());
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
                  );
                } else if (snapshot.hasError) {
                  return Text('Error!');
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
    );
  }
}
