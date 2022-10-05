import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/data/models/bulk_scan_response.dart';
import 'package:dartz/dartz.dart';

abstract class ScanRepository {
  Future<Either<Failure, BulkScanResponse>> bulkScan(String qrcodeSj);
}