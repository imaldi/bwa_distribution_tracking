import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'history_scan_event.dart';
part 'history_scan_state.dart';

class HistoryScanBloc extends Bloc<HistoryScanEvent, HistoryScanState> {
  HistoryScanBloc() : super(HistoryScanInitial()) {
    on<TestKeptHistoryStateEvent>((event, emit) {
      emit(HistoryScanLoading());

      emit(const HistoryScanLoaded(ScanUserHistoryResponse(data: [SendScanDataModel(nosj: "Test Statenya saja")])));
    });
  }
}
