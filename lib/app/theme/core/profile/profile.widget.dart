import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/validator/signup.validation.dart';
import 'package:suplo_project_8_12_2020/app/blocs/user/user.repository.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  _ProfileWidgetState() {
    fetchData();
  }
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _editingController = TextEditingController();
  SignupValidation _signupValidation = SignupValidation();
  UserRepository _userRepository = UserRepository();
  FirebaseAuth auth = FirebaseAuth.instance;

  User user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final _scaffolKey = GlobalKey<ScaffoldState>();

  DocumentSnapshot document;
  // DocumentSnapshot document;
  String initialText;

  void fetchData() async {
    // debugger();
    await users.doc(user.uid).get().then((value) {
      document = value;

      emailController.text = document.data()['email'];
      nameController.text = document.data()['name'];
      phoneController.text = document.data()['phone'];
      _editingController.text = document.data()['name'];
    });
  }

  _buildContent() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 180, bottom: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -60, 0),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 15)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'),
                        radius: 50,
                      ),
                      height: 130,
                      width: 130,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          transform: Matrix4.translationValues(0, -60, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          )),
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder(
                          stream: _signupValidation.nameStream,
                          builder: (context, snapshot) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('Họ và tên'),
                                  TextFormField(
                                    controller: nameController,
                                    style: TextStyle(fontSize: 15, height: 0.7),
                                    // validator: _validateFullname,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập họ tên',
                                      errorText: snapshot.hasError
                                          ? snapshot?.error
                                          : null,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                      // border: InputBorder.none
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      StreamBuilder(
                          stream: _signupValidation.emailStream,
                          builder: (context, snapshot) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('Email'),
                                  TextFormField(
                                    controller: emailController,
                                    style: TextStyle(fontSize: 15, height: 0.7),
                                    decoration: InputDecoration(
                                      errorText: snapshot.hasError
                                          ? snapshot?.error
                                          : null,
                                      hintText: 'Nhập email',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      StreamBuilder(
                          stream: _signupValidation.phoneStream,
                          builder: (context, snapshot) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('Số điện thoại'),
                                  TextFormField(
                                    controller: phoneController,
                                    style: TextStyle(fontSize: 15, height: 0.7),
                                    // validator: _validatePhoneNumber,
                                    decoration: InputDecoration(
                                      errorText: snapshot.hasError
                                          ? snapshot?.error
                                          : null,
                                      hintText: 'Nhập số điện thoại',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img_blogs_1.png'),
              fit: BoxFit.cover)),
    );
  }

  _buildLabel(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }

  void onUpdateClick() {
    // debugger();
    bool isValid = _signupValidation.isValid(
        email: emailController.text,
        name: nameController.text,
        pass: '88888888',
        phone: phoneController.text);
    if (isValid) {
      user.updateEmail(emailController.text);
      // auth.currentUser.updateEmail(emailController.text);

      _userRepository.updateUser(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
      );
      _scaffolKey.currentState.showSnackBar(SnackBar(
        content: Text('Cập nhật thành công'),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // fetchData();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffolKey,
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        body: Stack(
          children: [
            _buildHeader(),
            Container(
              child: ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [_buildContent()],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: width,
                child: Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          width: (width - 40) / 2,
                          alignment: Alignment.center,
                          child: Text(
                            'Quay lại',
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          new TextEditingController().clear();
                          onUpdateClick();
                        },
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black),
                          width: (width - 40) / 2,
                          child: Text('Lưu thay đổi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
