import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/surat_jalan_per_page_params.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/surat_jalan/get_surat_jalan_per_page.dart';


part 'surat_jalan_state.dart';

class SuratJalanCubit extends Cubit<SuratJalanState> {
  final GetSuratJalanPerPageUseCase _getSuratJalanUseCase;
  SuratJalanCubit(this._getSuratJalanUseCase) : super(SuratJalanState());

  void getSuratJalanPerPage(int pageNumber) async {
    emit(state.copyWith(isLoading: true));
    var resultOrFailed = await _getSuratJalanUseCase(SuratJalanPerPageParams(pageNumber));
    var newResponse = resultOrFailed.fold((l) => const SuratJalanResponse(), (r) => r);
    emit(state.copyWith(isLoading: false, suratJalanResponse: newResponse));
    print("surat Jalan total page: ${state.suratJalanResponse?.data?.total}");
  }
}
