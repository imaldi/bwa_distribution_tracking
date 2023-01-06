import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/surat_jalan_per_page_params.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/params/bulk_scan_params.dart';
import '../../../../data/models/qr_scan/bulk_scan_response.dart';
import '../../../../domain/usecases/scan_qr/get_history_per_id.dart';
import '../../../../domain/usecases/surat_jalan/get_surat_jalan_per_page.dart';


part 'surat_jalan_state.dart';

class SuratJalanCubit extends Cubit<SuratJalanState> {
  final GetSuratJalanPerPageUseCase _getSuratJalanUseCase;
  final GetHistoryPerIdUseCase _getHistoryPerIdUseCase;
  SuratJalanCubit(this._getSuratJalanUseCase,this._getHistoryPerIdUseCase) : super(SuratJalanState());

  void getSuratJalanPerPage(int pageNumber,{String? menuStatusForTitle}) async {
    emit(state.copyWith(isLoading: true));
    var resultOrFailed = await _getSuratJalanUseCase(SuratJalanPerPageParams(pageNumber));
    var newResponse = resultOrFailed.fold((l) => const SuratJalanResponse(), (r) => r);
    emit(state.copyWith(isLoading: false, suratJalanResponse: newResponse, isFetchingList: true, menuStatusForTitle: menuStatusForTitle));
    print("surat Jalan total page: ${state.suratJalanResponse?.data?.total}");
    print("is viewing list: ${state.isFetchingList}");
  }

  void getSuratJalanPerId(String qrcode_id,{String? menuStatusForTitle}) async {
    emit(state.copyWith(isLoading: true));
    var resultOrFailed = await _getHistoryPerIdUseCase(SuratJalanParams(qrcode_id));
    var newResponse = resultOrFailed.fold((l) => const BulkScanResponse(), (r) => r);
    emit(state.copyWith(isLoading: false, searchResult: newResponse, isFetchingList: true, isPerSJ: true));
    print("Search Result: ${state.searchResult}");
  }

  void setWillScanDus(){
    emit(state.copyWith(willScanDus: true));
    print("state.willScanDus: ${state.willScanDus}");
  }

  void resetStateViewList(){
    emit(state.copyWith(isFetchingList: false,willScanDus: false,menuStatusForTitle: "-"));
  }

  void setPerScanSJ(){
    emit(state.copyWith(isPerSJ: true));
    print("set per sj: ${state.isPerSJ}");
  }

  void resetToNotPerScanSJ(){
    emit(state.copyWith(isPerSJ: false));
  }
}
