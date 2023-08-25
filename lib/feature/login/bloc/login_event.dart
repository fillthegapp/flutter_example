part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class OnEmailChangedEvent extends LoginEvent {
  final String email;

  const OnEmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class OnPinChangedEvent extends LoginEvent {
  final String pin;

  const OnPinChangedEvent({required this.pin});

  @override
  List<Object?> get props => [pin];
}

class OnLoginButtonClickEvent extends LoginEvent {}
