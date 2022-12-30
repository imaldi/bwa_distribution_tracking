import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/location_address_params.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/open_street_map/open_street_map_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/geolocator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';


class GetCurrentAddressUseCase extends UseCase<OpenStreetMapResponse, LocationAddressParams>{
  LocationRepository repository;
  GetCurrentAddressUseCase(this.repository);
  @override
  Future<Either<Failure, OpenStreetMapResponse>> call(LocationAddressParams params) async {
    print("UseCase Current Address Called");
    return await repository.getCurrentAddress(params.latitude, params.longitude);
  }

}