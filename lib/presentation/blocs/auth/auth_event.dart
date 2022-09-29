part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class UserLoginAuthEvent extends AuthEvent{
  final String phone;
  final String password;

  const UserLoginAuthEvent(this.phone, this.password);

  @override
  List<Object?> get props => [
    phone,
    password,
  ];
}

class UserLogoutAuthEvent extends AuthEvent{
  @override
  List<Object?> get props => [];
}
