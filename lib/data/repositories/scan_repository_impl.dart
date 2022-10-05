import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/qr_scan_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:dartz/dartz.dart';

class ScanRepositoryImpl extends ScanRepository {
  final QRScanRemoteDataSource qrScanRemoteDataSource;
  final NetworkInfo networkInfo;
  ScanRepositoryImpl({
    required this.qrScanRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BulkScanResponse>> bulkScan(String qrcodeSj) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try{
      final remoteTrivia = await qrScanRemoteDataSource.bulkScan(qrcodeSj);

      return Right(remoteTrivia);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}