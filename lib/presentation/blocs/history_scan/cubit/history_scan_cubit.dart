import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:equatable/equatable.dart';

part 'history_scan_state.dart';

class HistoryScanCubit extends Cubit<HistoryScanCubitState> {
  HistoryScanCubit() : super(HistoryScanCubitState());

  initAllHistory(ScanUserHistoryResponse allHistoryResponse){
    emit(state.copyWith(allHistory: allHistoryResponse));
  }

  initUserHistory(ScanUserHistoryResponse scanUserHistoryResponse){
    emit(state.copyWith(userHistory: scanUserHistoryResponse));
  }


}
