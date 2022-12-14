import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/single_scan_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/platform/network_info.dart';
import '../datasources/remote/single_scan_remote_data_source.dart';

class SingleScanRepositoryImpl extends SingleScanRepository {
  final SingleScanRemoteDataSource singleScanRemoteDataSource;
  final NetworkInfo networkInfo;
  SingleScanRepositoryImpl(
    this.singleScanRemoteDataSource,
    this.networkInfo,
  );
  @override
  Future<Either<Failure, StoreSelesaiResponse>> sendRequestStoreSelesai(StoreSelesaiResponse selesaiResponse) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try{
      final response = await singleScanRemoteDataSource.sendRequestStoreSelesai(selesaiResponse);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DusScanResponse>> sendRequestScanSingleDusInsert(String nodus, String imagePath,
      // StoreSelesaiResponse wholeFormData
      ) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());
    try{
      final response = await singleScanRemoteDataSource.sendRequestScanSingleDusInsert(nodus, imagePath,
          // wholeFormData
      );

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, StoreSelesaiResponse>> fetchScannedDusList(StoreSelesaiResponse qrcodeSj) {
  //   // TODO: implement fetchScannedDusList
  //   throw UnimplementedError();
  // }




}