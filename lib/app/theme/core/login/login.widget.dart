import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.state.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/validator/login.validation.dart';
import 'package:suplo_project_8_12_2020/app/blocs/register/register.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/user/user.repository.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/account.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/components/loading.dialog.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/components/message.dialog.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/register.widget.dart';
import 'package:suplo_project_8_12_2020/utilities/constants.dart';

class LoginWidget extends StatefulWidget {
  final UserRepository _userRepository;
  //constructor
  LoginWidget({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  LoginValidation _loginValidation = LoginValidation();

  bool _rememberMe = false;
  bool _showPass = false;
  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(() {
      //when email is changed,this function is called !
      _loginBloc.add(LoginEventEmailChanged(email: _emailController.text));
    });
    _passController.addListener(() {
      //when password is changed,this function is called !
      _loginBloc.add(LoginEventPasswordChanged(password: _passController.text));
    });
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState loginState) =>
      loginState.isValidEmailAndPassword & isPopulated &&
      !loginState.isSubmitting;

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        // resizeToAvoidBottomPadding: true,
        body:
            BlocBuilder<LoginBloc, LoginState>(builder: (context, loginState) {
          if (loginState.isFailure) {
            print('Login failed');
          } else if (loginState.isSubmitting) {
            print('Logging in');
          } else if (loginState.isSuccess) {
            //add event: AuthenticationEventLoggedIn ?
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildEmailTF(),
                        SizedBox(
                          height: 15,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(loginState),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }

  void _onLoginClick() async {
    String email = _emailController.text;
    String pass = _passController.text;

    var isValid = _loginValidation.isValid(email, pass);
    if (isValid) {
      _loginBloc.add(LoginEventWithEmailAndPasswordPressed(
          email: _emailController.text, password: _passController.text));
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        StreamBuilder(
          stream: _loginValidation.emailStream,
          builder: (context, snapshot) => Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Email',
                    hintStyle: kHintTextStyle,
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
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            StreamBuilder(
              stream: _loginValidation.passStream,
              builder: (context, snapshot) => Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: kHintTextStyle,
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 13),
              child: GestureDetector(
                  onTap: onToggleShowPass,
                  child: Text(
                    _showPass ? 'HIDE' : 'SHOW',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        )
      ],
    );
  }

  Widget _buildLoginBtn(LoginState loginState) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _onLoginClick,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: [
        SizedBox(height: 5.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSocialBtn(
            () {},
            AssetImage(
              'assets/images/facebook.jpg',
            ),
          ),
          SizedBox(
            width: 35,
          ),
          _buildSocialBtn(
            () {},
            AssetImage(
              'assets/images/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return BlocProvider<RegisterBloc>(
                create: (context) =>
                    RegisterBloc(userRepository: _userRepository),
                child: RegisterWidget(userRepository: _userRepository));
          }),
        );
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignupWidget()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
