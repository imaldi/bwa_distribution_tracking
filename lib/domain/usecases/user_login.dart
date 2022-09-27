
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogin {
  final LoginRepository repository;

  UserLogin(this.repository);

  Future<Either<Failure, LoginResponse>> execute({
    required String userName,
    required String password,
  }) async {
    return await repository.login(userName,password);
  }
}