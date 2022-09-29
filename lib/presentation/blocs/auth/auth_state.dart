part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoaded extends AuthState {
  final LoginResponse loginResponse;
  AuthLoaded({required this.loginResponse});

  @override
  List<Object?> get props => [loginResponse];
}

class AuthFailed extends AuthState {
  final String errorMessage;

  get debug => "The Error is: $errorMessage";

  AuthFailed({this.errorMessage = "Unspecified Error"});

  @override
  List<Object?> get props => [errorMessage];
}
