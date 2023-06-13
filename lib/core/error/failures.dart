import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message});
}

class NoInternetFailure extends Failure {}

class CacheFailure extends Failure {}

class LocationServiceDisabledFailure extends Failure {}

class PermissionDeniedFailure extends Failure {}

class DataNotFoundFailure extends Failure {}
