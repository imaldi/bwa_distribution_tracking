import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_detail_response.dart';

import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';

import 'package:dartz/dartz.dart';

import '../../core/platform/network_info.dart';
import '../../domain/repositories/surat_jalan_repository.dart';
import '../datasources/remote/surat_jalan_remote_data_source.dart';

class SuratJalanRepositoryImpl extends SuratJalanRepository{
  final SuratJalanRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SuratJalanRepositoryImpl(this.remoteDataSource,this.networkInfo);
  @override
  Future<Either<Failure, SuratJalanResponse>> getSuratJalanPerPage(int pageNumber) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try{
      final result = await remoteDataSource.getSuratJalanPerPage(pageNumber);
      return Right(result);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BulkScanResponse>> getHistoryPerId(String qrCode) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try{
      final result = await remoteDataSource.getHistoryPerId(qrCode);
      return Right(result);
    }
    on DataNotFoundException {
      return Left(DataNotFoundFailure());
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DusDetailResponse>> getDusDetailByQrCodeSJ(String qrCode) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try{
      final result = await remoteDataSource.getDusDetailByQrCodeSJ(qrCode);
      return Right(result);
    }
    on DataNotFoundException {
      return Left(DataNotFoundFailure());
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }

}