import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
import 'package:equatable/equatable.dart';

part 'bulk_scan_screen_state.dart';

// TODO register in Service Locator
class BulkScanScreenCubit extends Cubit<BulkScanScreenState> {
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;
  BulkScanScreenCubit(this._getCurrentPositionUseCase)
      : super(const BulkScanScreenState(SendScanDataModel()));

  getCurrentCoordinate() async {
    var eitherPositionOrFailure = await _getCurrentPositionUseCase(NoParams());
    var newSendScanDataModel = eitherPositionOrFailure.fold(
        (l) => state.sendScanDataModel.copyWith(latitude: "", longtitude: ""),
        (r) => state.sendScanDataModel.copyWith(
            latitude: r.latitude.toString(),
            longtitude: r.longitude.toString()));
    emit(BulkScanScreenState(newSendScanDataModel));
    print("LATITUDE FROM CUBIT: ${state.sendScanDataModel.latitude}");
  }

  setFotoPath(String? path){
    emit(BulkScanScreenState(state.sendScanDataModel.copyWith(foto: path)));
    print("set foto path: ${path.toString()}");
  }
}
