import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
import 'package:equatable/equatable.dart';

part 'history_scan_state.dart';

class HistoryScanCubit extends Cubit<HistoryScanCubitState> {
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;

  HistoryScanCubit(this._getCurrentPositionUseCase) : super(HistoryScanCubitState());

  initAllHistory(ScanUserHistoryResponse allHistoryResponse){
    emit(state.copyWith(allHistory: allHistoryResponse));
  }

  initUserHistory(ScanUserHistoryResponse scanUserHistoryResponse){
    emit(state.copyWith(userHistory: scanUserHistoryResponse));
  }

  getCurrentCoordinate() async {
    var eitherPositionOrFailure = await _getCurrentPositionUseCase(NoParams());
    var newSelectedScanDataModel = eitherPositionOrFailure.fold(
            (l) => state.selectedPoint?.copyWith(latitude: "", longtitude: ""),
            (r) => state.selectedPoint?.copyWith(
            latitude: r.latitude.toString(),
            longtitude: r.longitude.toString()));
    emit(state.copyWith(selectedPoint: newSelectedScanDataModel));
    print("LATITUDE FROM CUBIT: ${state.selectedPoint?.latitude}");
    print("LONGITUDE FROM CUBIT: ${state.selectedPoint?.longtitude}");
  }


}
