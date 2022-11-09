import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetAllScanHistoryUseCase extends UseCase<ScanUserHistoryResponse, NoParams> {
  final ScanRepository scanRepository;

  GetAllScanHistoryUseCase(this.scanRepository);
  @override
  Future<Either<Failure, ScanUserHistoryResponse>> call(NoParams params) {
    return scanRepository.getUserScanHistory();
  }

}
