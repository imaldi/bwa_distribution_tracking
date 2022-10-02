import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class CheckUserLoginStatusUseCase extends UseCase<LoginResponse, NoParams> {
  final AuthRepository repository;

  CheckUserLoginStatusUseCase(this.repository);
  @override
  Future<Either<Failure, LoginResponse>> call(NoParams params) async {
    return await repository.getCachedLogin();
  }
}
