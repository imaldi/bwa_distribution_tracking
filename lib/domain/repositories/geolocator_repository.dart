import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/open_street_map/open_street_map_response.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentPosition();
  Future<Either<Failure, OpenStreetMapResponse>> getCurrentAddress(double latitude, double longitude);
}