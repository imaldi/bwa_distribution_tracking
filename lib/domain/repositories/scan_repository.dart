import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:dartz/dartz.dart';

abstract class ScanRepository {
  Future<Either<Failure, BulkScanResponse>> bulkScan(String qrcodeSj);
  Future<Either<Failure, SendScanResponse>> sendScan(SendScanDataModel model, int total);
  Future<Either<Failure, ScanUserHistoryResponse>> getUserScanHistory();
  Future<Either<Failure, ScanUserHistoryResponse>> getAllScanHistory();
}