import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/current_location_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/open_street_map/open_street_map_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/geolocator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:geolocator/geolocator.dart';


class LocationRepositoryImpl extends LocationRepository {
  final CurrentLocationRemoteDataSource currentLocationRemoteDataSource;
  final NetworkInfo networkInfo;

  LocationRepositoryImpl(
      {required this.currentLocationRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());
    try {
      final position = await currentLocationRemoteDataSource.getCurrentLocation();
      // authLocalDataSource.cacheLoginResponse(remoteTrivia);
      print("LATITUDE FROM REPO: ${position.latitude}");
      return Right(position);
    } on LocationServiceDisabledException {
      print("LATITUDE FROM REPO: LocationServiceDisabledFailure");
      return Left(LocationServiceDisabledFailure());
    } on PermissionDeniedException {
      print("LATITUDE FROM REPO: PermissionDeniedFailure");
      return Left(PermissionDeniedFailure());
    }
  }

  @override
  Future<Either<Failure, OpenStreetMapResponse>> getCurrentAddress(double latitude, double longitude) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());
    try {
      final address = await currentLocationRemoteDataSource.getCurrentAddress(latitude, longitude);
      // authLocalDataSource.cacheLoginResponse(remoteTrivia);
      print("address: $address");
      return Right(address);
    } on ServerException{
      print("Error di request");
      return Left(ServerFailure());
    }
  }
}
