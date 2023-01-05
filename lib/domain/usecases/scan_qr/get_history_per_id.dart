import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/domain/repositories/surat_jalan_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/params/bulk_scan_params.dart';
import '../../../data/models/qr_scan/bulk_scan_response.dart';

class GetHistoryPerIdUseCase extends UseCase<BulkScanResponse,SuratJalanParams>{
  final SuratJalanRepository repository;
  GetHistoryPerIdUseCase(this.repository);

  @override
  Future<Either<Failure, BulkScanResponse>> call(SuratJalanParams params) {
    return repository.getHistoryPerId(params.qrcodeSj);
  }

}