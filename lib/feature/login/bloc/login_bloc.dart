import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/feature/login/bloc/form_submission_state.dart';
import 'package:flutter_example/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository)
      : super(LoginState(formStatus: FormInitialState())) {
    on<OnEmailChangedEvent>((event, emit) {
      if ((state.formStatus is FormInitialState) ||
          (state.formStatus is FormInvalidUser)) {
        if (isValidEmail(event.email)) {
          emit(LoginState(email: event.email, formStatus: state.formStatus));
        } else {
          emit(LoginState(email: event.email, formStatus: FormInvalidUser()));
        }
      }
    });

    on<OnPinChangedEvent>((event, emit) {
      if (state.formStatus is FormInitialState) {
        if (isValidPin(event.pin)) {
          emit(LoginState(pin: event.pin, formStatus: state.formStatus));
        } else {
          emit(LoginState(pin: event.pin, formStatus: FormInvalidPin()));
        }
      }
    });

    on<OnLoginButtonClickEvent>((event, emit) async {
      emit(LoginState(formStatus: FormSubmittingState()));

      try {
        await authRepository.login();
        emit(LoginState(formStatus: FormSubmitSuccessState()));
      } catch (e) {
        emit(LoginState(formStatus: FormSubmitFailedState(e as Exception)));
      }
    });
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool isValidPin(String pin) {
    return (pin.length == 4);
  }
}
