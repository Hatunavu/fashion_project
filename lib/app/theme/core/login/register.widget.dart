//something like "LoginPage" !

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/validator/signup.validation.dart';
import 'package:suplo_project_8_12_2020/app/blocs/register/register.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/register/register.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/register/register.state.dart';
import 'package:suplo_project_8_12_2020/app/blocs/user/user.repository.dart';

class RegisterWidget extends StatefulWidget {
  final UserRepository _userRepository;
  RegisterWidget({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterWidget> createState() => _RegisterWidget();
}

class _RegisterWidget extends State<RegisterWidget> {
  UserRepository get _userRepository => widget._userRepository;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  RegisterBloc _registerBloc;
  SignupValidation signupValidation = SignupValidation();
  bool _showPass = false;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isValidEmailAndPassword && isPopulated && !state.isSubmitting;
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, registerState) {
            if (registerState.isFailure) {
              print('Registration Failed');
            } else if (registerState.isSubmitting) {
              print('Registration in progress...');
            } else if (registerState.isSuccess) {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationEventLoggedIn());
            }
            return GestureDetector(
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
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 100, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          _buildEmail('Email'),
                          _buildName('Full Name'),
                          _buildPhone('Phone Number'),
                          _buildPass('Password'),
                          _buildSignUpBtn(),
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmail(String content) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: StreamBuilder(
            stream: signupValidation.emailStream,
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
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: content,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
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
          stream: signupValidation.nameStream,
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
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: content,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.4),
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
            stream: signupValidation.passStream,
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
                    controller: _passwordController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: content,
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(.4),
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
                      color: Colors.black,
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
        stream: signupValidation.phoneStream,
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
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: content,
                    errorText: snapshot.hasError ? snapshot.error : null,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(.4),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
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
        color: Colors.black,
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
    var isValid = signupValidation.isValid(
        name: _nameController.text,
        email: _emailController.text,
        pass: _passwordController.text,
        phone: _phoneController.text);
    if (isValid) {
      _registerBloc.add(
        RegisterEventPressed(
            email: _emailController.text,
            password: _passwordController.text,
            name: _nameController.text,
            phone: _phoneController.text),
      );
      Navigator.of(context).pop();
    }
  }
}
