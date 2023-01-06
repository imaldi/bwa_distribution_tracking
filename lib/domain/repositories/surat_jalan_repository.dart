import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/qr_scan/dus_detail_response.dart';

abstract class SuratJalanRepository {
  Future<Either<Failure, SuratJalanResponse>> getSuratJalanPerPage(int pageNumber);
  Future<Either<Failure, BulkScanResponse>> getHistoryPerId(String qrCode);
  Future<Either<Failure, DusDetailResponse>> getDusDetailByQrCodeSJ(String qrCode);
}