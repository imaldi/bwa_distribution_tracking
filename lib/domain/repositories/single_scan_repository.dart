import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/qr_scan/dus_list_response/dus_scan_response.dart';

abstract class SingleScanRepository {
  Future<Either<Failure, StoreSelesaiResponse>> sendRequestStoreSelesai(
      StoreSelesaiResponse response);

  Future<Either<Failure, DusScanResponse>> sendRequestScanSingleDusInsert(
    String nodus,
    String filePath,
    int currentDusNumber,
    // StoreSelesaiResponse wholeFormData
  );
// Future<Either<Failure, StoreSelesaiResponse>> fetchScannedDusList(StoreSelesaiResponse qrcodeSj);
}
