import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class SingleScanRepository {
  Future<Either<Failure, StoreSelesaiResponse>> sendRequestStoreSelesai(StoreSelesaiResponse qrcodeSj);
}