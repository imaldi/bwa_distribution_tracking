import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/domain/repositories/geolocator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';


class GetCurrentPositionUseCase extends UseCase<Position, NoParams>{
  LocationRepository repository;
  GetCurrentPositionUseCase(this.repository);
  @override
  Future<Either<Failure, Position>> call(NoParams params) async {
        print("UseCase Position Called");
        return await repository.getCurrentPosition();
  }

}