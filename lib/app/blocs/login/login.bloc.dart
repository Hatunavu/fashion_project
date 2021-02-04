import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.state.dart';
import 'package:suplo_project_8_12_2020/app/blocs/user/user.repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  //constructor
  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.initial());
  //Give 2 adjacent events a "debounce time"
  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> loginEvents,
    TransitionFunction<LoginEvent, LoginState> transitionFunction,
  ) {
    final debounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is LoginEventEmailChanged ||
          loginEvent is LoginEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300)); //minimum 300ms for each event
    final nonDebounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is! LoginEventEmailChanged &&
          loginEvent is! LoginEventPasswordChanged);
    });
    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFunction);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
    final loginState = state; //for easier to read code purpose !
    if (loginEvent is LoginEventEmailChanged) {
      yield loginState.cloneAndUpdate();
      // isValidEmail: Validators.isValidEmail(loginEvent.email));
    } else if (loginEvent is LoginEventPasswordChanged) {
      yield loginState.cloneAndUpdate();
      // isValidPassword: Validators.isValidPassword(loginEvent.password));

    } else if (loginEvent is LoginEventWithEmailAndPasswordPressed) {
      try {
        await _userRepository.signInWithEmailAndPassword(
            loginEvent.email, loginEvent.password);
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    }
  }
}
