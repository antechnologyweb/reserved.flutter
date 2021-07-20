part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();
  List<Object?> get props => [];
}

class LoginSubmit extends AuthorizationEvent {
  const LoginSubmit(this.body);

  final Map<String, dynamic> body;

  @override
  List<Object?> get props => [body];
}

class LogOutSubmit extends AuthorizationEvent {}

class RegisterSubmit extends AuthorizationEvent {
  const RegisterSubmit(this.body);

  final Map<String, dynamic> body;

  @override
  List<Object?> get props => [body];
}

class LoginViaTokenSubmit extends AuthorizationEvent {
  const LoginViaTokenSubmit();

  @override
  List<Object?> get props => [];
}
