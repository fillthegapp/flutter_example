part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class OnEmailChangedEvent extends LoginEvent {
  final String email;

  OnEmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
