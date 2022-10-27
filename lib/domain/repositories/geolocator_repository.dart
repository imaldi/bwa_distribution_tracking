import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

abstract class GeolocatorRepository {
  Future<Either<Failure, Position>> getCurrentPosition();
}