import 'package:flutter/cupertino.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/signup.bloc.dart';

class MyApp extends InheritedWidget {
  final SignupBloc signupBloc;
  final Widget child;
  MyApp(this.signupBloc, this.child) : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}
