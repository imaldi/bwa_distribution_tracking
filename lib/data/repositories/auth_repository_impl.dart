import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authRemoteDataSource,
      required this.authLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponse?>?>? login(
      String phone, String password) async {
    if(
    (await networkInfo.isConnected) ?? true
    ) {
      try {
        final remoteTrivia = await authRemoteDataSource.login(phone, password);
        authLocalDataSource.cacheLoginResponse(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localTrivia = await authLocalDataSource.getCachedLogin();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }




}