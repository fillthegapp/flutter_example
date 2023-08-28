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
        } else if (state.formStatus is FormSubmittingState) {
          return Scaffold(body: _loginFormLoading(context));
        } else if (state.formStatus is FormSubmitSuccessState) {
          Navigator.pushReplacementNamed(context, 'museum_list');
          return Container();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                    text: 'Email',
                    icon: const Icon(Icons.person),
                    validateText: (value) => {print('validate initial')},
                    onChangeText: (value) => {
                          context
                              .read<LoginBloc>()
                              .add(OnEmailChangedEvent(email: value))
                        },
                    secret: false,
                    inputType: TextInputType.emailAddress,
                    autocorrect: false,
                    maxLength: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {},
                  onChangeText: (value) => {
                    context.read<LoginBloc>().add(OnPinChangedEvent(pin: value))
                  },
                  secret: true,
                  autocorrect: false,
                  inputType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                    text: 'Submit',
                    onClickButton: () => {
                          context
                              .read<LoginBloc>()
                              .add(OnLoginButtonClickEvent())
                        }),
              )
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                    text: 'Email',
                    icon: const Icon(Icons.person),
                    validateText: (value) =>
                        {print('validate the invalid user')},
                    onChangeText: (value) => {
                          context
                              .read<LoginBloc>()
                              .add(OnEmailChangedEvent(email: value))
                        },
                    secret: false,
                    inputType: TextInputType.emailAddress,
                    autocorrect: false,
                    maxLength: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {},
                  onChangeText: (value) => {
                    context.read<LoginBloc>().add(OnPinChangedEvent(pin: value))
                  },
                  secret: true,
                  autocorrect: false,
                  inputType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                    text: 'Submit',
                    onClickButton: () => {
                          context
                              .read<LoginBloc>()
                              .add(OnLoginButtonClickEvent())
                        }),
              )
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                    text: 'Email',
                    icon: const Icon(Icons.person),
                    validateText: (value) => {},
                    onChangeText: (value) => {
                          context
                              .read<LoginBloc>()
                              .add(OnEmailChangedEvent(email: value))
                        },
                    secret: false,
                    inputType: TextInputType.emailAddress,
                    autocorrect: false,
                    maxLength: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {print('validate the invalid pin')},
                  onChangeText: (value) => {
                    context.read<LoginBloc>().add(OnPinChangedEvent(pin: value))
                  },
                  secret: true,
                  autocorrect: false,
                  inputType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                    text: 'Submit',
                    onClickButton: () => {
                          context
                              .read<LoginBloc>()
                              .add(OnLoginButtonClickEvent())
                        }),
              )
            ],
          ),
        ));
  }

  Widget _loginFormLoading(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                    text: 'Email',
                    icon: const Icon(Icons.person),
                    validateText: (value) => {print('validate')},
                    onChangeText: (value) => {
                          context
                              .read<LoginBloc>()
                              .add(OnEmailChangedEvent(email: value))
                        },
                    secret: false,
                    inputType: TextInputType.emailAddress,
                    autocorrect: false,
                    maxLength: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInput(
                  text: 'Pin',
                  icon: const Icon(Icons.security),
                  validateText: (value) => {},
                  onChangeText: (value) => {
                    context.read<LoginBloc>().add(OnPinChangedEvent(pin: value))
                  },
                  secret: true,
                  autocorrect: false,
                  inputType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator())
            ],
          ),
        ));
  }
}
