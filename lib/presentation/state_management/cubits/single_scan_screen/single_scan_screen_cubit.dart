import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_list_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/qr_scan/dus_list_response/store_selesai_header.dart';
import '../../../../domain/repositories/single_scan_repository.dart';



part 'single_scan_screen_cubit.freezed.dart';

part 'single_scan_screen_cubit.g.dart';

part 'single_scan_screen_state.dart';

class SingleScanScreenCubit extends Cubit<SingleScanScreenCubitState> {
  SingleScanRepository repository;
  SingleScanScreenCubit(this.repository) : super(const SingleScanScreenCubitState());

  void updateStoreSelesaiResponse(
      StoreSelesaiHeader Function(StoreSelesaiHeader) callback) {
    emit(state.copyWith.storeSelesaiResponse!(
        header: callback(
            state.storeSelesaiResponse?.header ?? const StoreSelesaiHeader())));
    print("header: ${state.storeSelesaiResponse?.header}");
  }

  Future<void> sendRequestScanDus(String nodus, String filePath) async {
    var resultOrFailure = await repository.sendRequestScanSingleDusInsert(nodus, filePath,
        // state.storeSelesaiResponse ?? const StoreSelesaiResponse()
    );
    var response = resultOrFailure.fold((l) => const DusScanResponse(), (r) => r);
    emit(state.copyWith(dusScanResponse: response));
    print("Dus Scan Response from cubit: ${state.dusScanResponse}");
  }

  void fetchScannedDusList(){

  }
}
