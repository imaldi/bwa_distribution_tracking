part of 'auth_bloc.dart';

@immutable
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
  String errorMessage;
  set theErrorIs(String message) {
      errorMessage = "The Error is $message";
  }
  AuthFailed({this.errorMessage = "Unspecified Error"});

  @override
  List<Object?> get props => [
    errorMessage
  ];
}
