import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/send_scan_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:dartz/dartz.dart';

class SendScanUseCase extends UseCase<SendScanResponse,SendScanParams>{
  final ScanRepository scanRepository;

  SendScanUseCase(this.scanRepository);
  @override
  Future<Either<Failure, SendScanResponse>> call(SendScanParams params)  {
    return scanRepository.sendScan(params.model);
  }

}