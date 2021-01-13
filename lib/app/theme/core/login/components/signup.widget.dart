import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/signup.bloc.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/components/loading.dialog.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/components/message.dialog.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/home.widget.dart';
import 'package:suplo_project_8_12_2020/utilities/constants.dart';

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  SignupBloc signupBloc = SignupBloc();
  bool _showPass = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    signupBloc.dispose();
    super.dispose();
  }

  Widget _buildEmail(String content) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: StreamBuilder(
            stream: signupBloc.emailStream,
            builder: (context, snapshot) {
              print('snapshot.error: ${snapshot.error}');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
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
                    height: 50,
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Color(0xFF86744e),
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: content,
                          hintStyle: TextStyle(
                            color: Color(0xFF86744e).withOpacity(.4),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      snapshot?.error ?? '',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                ],
              );
            }));
  }

  Widget _buildName(String content) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: StreamBuilder(
          stream: signupBloc.nameStream,
          builder: (context, snapshot) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
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
                height: 50,
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                    color: Color(0xFF86744e),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: content,
                    hintStyle: TextStyle(
                      color: Color(0xFF86744e).withOpacity(.4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  snapshot?.error ?? '',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildPass(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          StreamBuilder(
            stream: signupBloc.passStream,
            builder: (context, snapshot) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
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
                  height: 50,
                  child: TextField(
                    controller: _passController,
                    style: TextStyle(
                      color: Color(0xFF86744e),
                    ),
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: content,
                        hintStyle: TextStyle(
                          color: Color(0xFF86744e).withOpacity(.4),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    snapshot?.error ?? '',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 15),
            child: GestureDetector(
                onTap: onToggleShowPass,
                child: Text(
                  _showPass ? 'HIDE' : 'SHOW',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  Widget _buildPhone(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: StreamBuilder(
        stream: signupBloc.phoneStream,
        builder: (context, snapshot) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
              height: 50,
              child: TextField(
                controller: _phoneController,
                style: TextStyle(
                  color: Color(0xFF86744e),
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: content,
                    errorText: snapshot.hasError ? snapshot.error : null,
                    hintStyle: TextStyle(
                      color: Color(0xFF86744e).withOpacity(.4),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          onSignupClicked();
        },
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF86744e),
        child: Text(
          'Sign Up',
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

  void onSignupClicked() {
    // debugger();
    var isValid = signupBloc.isValid(
        name: _nameController.text,
        email: _emailController.text,
        pass: _passController.text,
        phone: _phoneController.text);
    print('isValid: $isValid');
    if (isValid) {
      //create user
      //loading dialog
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      signupBloc.signUp(
          email: _emailController.text,
          pass: _passController.text,
          phone: _phoneController.text,
          name: _nameController.text,
          onSuccess: () {
            LoadingDialog.hideLoadingDialog(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          onError: (msg) {
            //show message dialog
            LoadingDialog.hideLoadingDialog(context);
            MessageDialog.showMsgDialog(context, 'Sign in', msg);
          });
    }
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(244, 243, 243, 1)),
            ),
            Container(
              height: height,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF86744e),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildEmail('Email'),
                    _buildName('Full Name'),
                    _buildPhone('Phone Number'),
                    _buildPass('Password'),
                    _buildLoginBtn(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
