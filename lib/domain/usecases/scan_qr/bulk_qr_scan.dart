import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/bulk_scan_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:dartz/dartz.dart';

class BulkQRScanUseCase extends UseCase<BulkScanResponse,BulkScanParams>{
  final ScanRepository scanRepository;

  BulkQRScanUseCase(this.scanRepository);
  @override
  Future<Either<Failure, BulkScanResponse>> call(BulkScanParams params) {
    return scanRepository.bulkScan(params.qrcodeSj);
  }

}