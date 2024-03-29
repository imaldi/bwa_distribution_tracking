import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(String phone, String password);
  Future<Either<Failure, LoginResponse>> getCachedLogin();
  Future<Either<Failure, bool>> logout();
}
