import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/surat_jalan_per_page_params.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/surat_jalan_repository.dart';

class GetSuratJalanPerPageUseCase extends UseCase<SuratJalanResponse,SuratJalanPerPageParams>{
  final SuratJalanRepository _suratJalanRepository;
  GetSuratJalanPerPageUseCase(this._suratJalanRepository);
  @override
  Future<Either<Failure, SuratJalanResponse>> call(params) async {
    return _suratJalanRepository.getSuratJalanPerPage(params.pageNumber,params.statusPengiriman);
  }

}