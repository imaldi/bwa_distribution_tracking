import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

part 'bulk_scan_screen_state.dart';

// TODO register in Service Locator
class BulkScanScreenCubit extends Cubit<BulkScanScreenState> {
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;
  BulkScanScreenCubit(this._getCurrentPositionUseCase)
      : super(const BulkScanScreenState(SendScanDataModel()));

  updateModelState(SendScanDataModel Function(SendScanDataModel) changeCallback){
    emit(state.copyWith(sendScanDataModel: changeCallback(state.sendScanDataModel)));
    print("Updated Status data: ${state.sendScanDataModel.statusPengiriman}");
  }

  getCurrentCoordinateAndAddress() async {
    var eitherPositionOrFailure = await _getCurrentPositionUseCase(NoParams());
    var newSendScanDataModel = eitherPositionOrFailure.fold(
        (l) => state.sendScanDataModel.copyWith(latitude: "", longtitude: ""),
        (r) => state.sendScanDataModel.copyWith(
            latitude: r.latitude.toString(),
            longtitude: r.longitude.toString()));
    emit(BulkScanScreenState(newSendScanDataModel));
    _getAddress(double.parse(state.sendScanDataModel.latitude ?? "0"), double.parse(state.sendScanDataModel.latitude ?? "0"));
    print("LATITUDE FROM CUBIT: ${state.sendScanDataModel.latitude}");
  }

  _getAddress(double lat, double long) async {
    await placemarkFromCoordinates(
        lat, lat)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      emit(state.copyWith(address: place.name));
      print("Alamat dari cubit: ${state.address}");
      // setState(() {
      //   _currentAddress =
      //   '${place.street}, ${place.subLocality},
      //   ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
    }).catchError((e) {
      print(e);
    });
  }

  setFotoPath(String? path){
    emit(BulkScanScreenState(state.sendScanDataModel.copyWith(foto: path)));
    print("LATITUDE FROM SET FOTO CUBIT: ${state.sendScanDataModel.latitude}");
    print("LONGITUDE FROM SET FOTO CUBIT: ${state.sendScanDataModel.longtitude}");
    print("set foto path: ${path.toString()}");
  }
}
