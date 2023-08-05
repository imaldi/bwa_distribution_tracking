import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/qr_scan_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../core/resources/consts/strings.dart';
import '../models/auth/login_response.dart';

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

    try {
      final response = await qrScanRemoteDataSource.bulkScan(qrcodeSj);
      var authBox = Hive.box<LoginResponse>(authBoxKey);
      print(
          "authBox.get(cachedLoginResponse) token qrScan DS: ${authBox.get(cachedLoginResponse)?.token ?? ""}");

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } on DataNotFoundException {
      return Left(DataNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, SendScanResponse>> sendScan(
      SendScanDataModel model, int total) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try {
      final response = await qrScanRemoteDataSource.sendScan(model, total);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ScanUserHistoryResponse>> getUserScanHistory() async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try {
      final response = await qrScanRemoteDataSource.getUserScanHistory();

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ScanUserHistoryResponse>> getAllScanHistory() async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());

    try {
      final response = await qrScanRemoteDataSource.getAllScanHistory();

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
