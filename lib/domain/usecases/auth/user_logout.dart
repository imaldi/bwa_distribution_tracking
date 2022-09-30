import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogoutUseCase extends UseCase<void,NoParams> {
  final AuthRepository repository;

  UserLogoutUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.logout();
  }

}