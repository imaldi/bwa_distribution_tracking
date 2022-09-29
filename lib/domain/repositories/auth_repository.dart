import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(String phone, String password);
  // Future<Either<Failure, LoginResponse>> getRandomNumberTrivia();
}
