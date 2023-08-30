import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/feature/login/bloc/form_submission_state.dart';
import 'package:flutter_example/repository/auth_repository.dart';
import 'package:local_auth/local_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository)
      : super(LoginState(formStatus: FormCheckingState())) {
    on<OnBiometricCheckNeed>((event, emit) async {
      if (state.formStatus is FormCheckingState) {
        if (await authRepository.getLogged()) {
          final LocalAuthentication auth = LocalAuthentication();
          final bool canAuthenticateWithBiometrics =
              await auth.canCheckBiometrics;

          if (!canAuthenticateWithBiometrics) {
            emit(LoginState(formStatus: FormInitialState()));
          }

          try {
            final bool didAuthenticate = await auth.authenticate(
                localizedReason: 'Please authenticate to show account balance');
            if (didAuthenticate) {
              emit(LoginState(formStatus: FormSubmitSuccessState()));
            } else {
              emit(LoginState(formStatus: FormInitialState()));
            }
          } on PlatformException {
            emit(LoginState(formStatus: FormInitialState()));
          }
        } else {
          emit(LoginState(formStatus: FormInitialState()));
        }
      }
    });

    on<OnEmailChangedEvent>((event, emit) {
      if ((state.formStatus is FormInitialState) ||
          (state.formStatus is FormInvalidUser)) {
        if (_isValidEmail(event.email)) {
          emit(LoginState(email: event.email, formStatus: FormInitialState()));
        } else {
          emit(LoginState(email: event.email, formStatus: FormInvalidUser()));
        }
      }
    });

    on<OnPinChangedEvent>((event, emit) {
      if ((state.formStatus is FormInitialState) ||
          (state.formStatus is FormInvalidPin)) {
        if (_isValidPin(event.pin)) {
          emit(LoginState(pin: event.pin, formStatus: FormInitialState()));
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

  bool _isValidEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool _isValidPin(String pin) {
    return (pin.length == 4);
  }
}
