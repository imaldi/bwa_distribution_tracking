import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/location_address_params.dart';
import 'package:bwa_distribution_tracking/core/params/no_params.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_address.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';

part 'bulk_scan_screen_state.dart';

// TODO register in Service Locator
class BulkScanScreenCubit extends Cubit<BulkScanScreenState> {
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;
  final GetCurrentAddressUseCase _getCurrentAddressUseCase;
  BulkScanScreenCubit(this._getCurrentPositionUseCase, this._getCurrentAddressUseCase)
      : super(const BulkScanScreenState(SendScanDataModel()));

  updateModelState(SendScanDataModel Function(SendScanDataModel) changeCallback){
    emit(state.copyWith(sendScanDataModel: changeCallback(state.sendScanDataModel)));
  }

  getCurrentCoordinateAndAddress({Function(String lat, String lng, String address)? callBackAfterFetchLocation}) async {
    var eitherPositionOrFailure = await _getCurrentPositionUseCase(NoParams());
    var newSendScanDataModel = eitherPositionOrFailure.fold(
        (l) => state.sendScanDataModel.copyWith(latitude: "", longtitude: ""),
        (r) => state.sendScanDataModel.copyWith(
            latitude: r.latitude.toString(),
            longtitude: r.longitude.toString()));
    emit(BulkScanScreenState(newSendScanDataModel));
    _getAddress(double.parse(state.sendScanDataModel.latitude ?? "0"), double.parse(state.sendScanDataModel.longtitude ?? "0"));
    print("LATITUDE FROM CUBIT: ${state.sendScanDataModel.latitude}");
    if(callBackAfterFetchLocation != null){
      callBackAfterFetchLocation(state.sendScanDataModel.latitude ?? "", state.sendScanDataModel.longtitude ?? "", state.address ?? "");
    }
  }

  _getAddress(double lat, double long) async {
    var eitherPositionOrFailure = await _getCurrentAddressUseCase(LocationAddressParams(latitude: lat, longitude: long));
    var newState = eitherPositionOrFailure.fold(
            (l) => state.copyWith(address: ""),
            (r) => state.copyWith(
              address: r.displayName,
              sendScanDataModel: state.sendScanDataModel.copyWith(kota: r.address?.city ?? "" ),
            ));
    emit(newState);
  }

  setFotoPath(String? path){
    emit(BulkScanScreenState(state.sendScanDataModel.copyWith(foto: path)));
    print("LATITUDE FROM SET FOTO CUBIT: ${state.sendScanDataModel.latitude}");
    print("LONGITUDE FROM SET FOTO CUBIT: ${state.sendScanDataModel.longtitude}");
    print("set foto path: ${path.toString()}");
  }
}
