part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;

  final String pin;
  final FormSubmissionState formStatus;

  const LoginState({
    this.email = '',
    this.pin = '',
    required this.formStatus,
  });

  @override
  List<Object> get props => [email, pin];
}
