import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/feature/login/bloc/login_bloc.dart';
import 'package:flutter_example/widget/button_basic.dart';

import '../../../widget/text_input.dart';
import '../bloc/form_submission_state.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        // Create screen depending on state
        if (state.formStatus is FormInitialState) {
          return Scaffold(body: _loginForm(context));
        } else if (state.formStatus is FormInvalidUser) {
          return Scaffold(body: _loginFormInvalidUser(context));
        } else if (state.formStatus is FormInvalidPin) {
          return Scaffold(body: _loginFormInvalidPin(context));
        } else {
          return Scaffold(body: _loginForm(context));
        }
      },
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                text: 'Email',
                icon: const Icon(Icons.person),
                onChangeText: (value) => {
                  context
                      .read<LoginBloc>()
                      .add(OnEmailChangedEvent(email: value))
                },
                validateText: (value) => {},
                secret: false,
              ),
              TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {},
                  onChangeText: (value) => {
                        context
                            .read<LoginBloc>()
                            .add(OnPinChangedEvent(pin: value))
                      },
                  secret: true),
              Button(
                  text: 'Submit',
                  onClickButton: () => {
                        context.read<LoginBloc>().add(OnLoginButtonClickEvent())
                      })
            ],
          ),
        ));
  }

  Widget _loginFormInvalidUser(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                text: 'Email',
                icon: const Icon(Icons.person),
                onChangeText: (value) => {
                  context
                      .read<LoginBloc>()
                      .add(OnEmailChangedEvent(email: value))
                },
                validateText: (value) => {},
                secret: false,
              ),
              TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {'Please enter a valid email'},
                  onChangeText: (value) => {
                        context
                            .read<LoginBloc>()
                            .add(OnPinChangedEvent(pin: value))
                      },
                  secret: true),
              Button(
                  text: 'Submit',
                  onClickButton: () => {
                        context.read<LoginBloc>().add(OnLoginButtonClickEvent())
                      })
            ],
          ),
        ));
  }

  Widget _loginFormInvalidPin(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                text: 'Email',
                icon: const Icon(Icons.person),
                onChangeText: (value) => {
                  context
                      .read<LoginBloc>()
                      .add(OnEmailChangedEvent(email: value))
                },
                validateText: (value) => {},
                secret: false,
              ),
              TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {'The pin should have 4 characters'},
                  onChangeText: (value) => {
                        context
                            .read<LoginBloc>()
                            .add(OnPinChangedEvent(pin: value))
                      },
                  secret: true),
              Button(
                  text: 'Submit',
                  onClickButton: () => {
                        context.read<LoginBloc>().add(OnLoginButtonClickEvent())
                      })
            ],
          ),
        ));
  }
}
