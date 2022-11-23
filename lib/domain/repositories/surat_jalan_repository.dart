import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class SuratJalanRepository {
  Future<Either<Failure, SuratJalanResponse>> getSuratJalanPerPage(int pageNumber);
}