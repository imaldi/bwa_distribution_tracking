import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';

import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/surat_jalan_repository.dart';
import '../datasources/remote/surat_jalan_remote_data_source.dart';

class SuratJalanRepositoryImpl extends SuratJalanRepository{
  final SuratJalanRemoteDataSource remoteDataSource;
  SuratJalanRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, SuratJalanResponse>> getSuratJalanPerPage(int pageNumber) async {
    try{
      final result = await remoteDataSource.getSuratJalanPerPage(pageNumber);
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

}