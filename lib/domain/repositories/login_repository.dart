import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(String userName, String password);
  // Future<Either<Failure, LoginResponse>> getRandomNumberTrivia();
}