import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/login_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLoginUseCase extends UseCase<LoginResponse, LoginParams> {
  final AuthRepository repository;

  UserLoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params) async {
    return await repository.login(params.phone, params.password);
  }
}
