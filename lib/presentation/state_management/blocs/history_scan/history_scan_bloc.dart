import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/get_all_scan_history.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/get_user_scan_history.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'history_scan_event.dart';
part 'history_scan_state.dart';

class HistoryScanBloc extends Bloc<HistoryScanEvent, HistoryScanState> {
  final GetUserScanHistoryUseCase _getUserScanHistoryUseCase;
  final GetAllScanHistoryUseCase _getAllScanHistoryUseCase;

  HistoryScanBloc(this._getUserScanHistoryUseCase, this._getAllScanHistoryUseCase) : super(HistoryScanInitial()) {
    on<GetUserScanHistoryEvent>((event, emit) async {
      emit(HistoryScanLoading());
      var failOrLoaded =
      await _getUserScanHistoryUseCase(NoParams());
      var currentState = failOrLoaded.fold((l) => HistoryScanFailed(), (r) => UserHistoryScanLoaded(r));
      emit(currentState);
    });

    on<GetAllScanHistoryEvent>((event, emit) async {
      emit(HistoryScanLoading());
      var failOrLoaded =
      await _getAllScanHistoryUseCase(NoParams());
      var currentState = failOrLoaded.fold((l) => HistoryScanFailed(), (r) => AllHistoryScanLoaded(r));
      emit(currentState);
    });

    on<TestKeptHistoryStateEvent>((event, emit) {
      emit(HistoryScanLoading());

      emit(const UserHistoryScanLoaded(ScanUserHistoryResponse(data: [SendScanDataModel(nosj: "Test Statenya saja")])));
    });
  }
}
