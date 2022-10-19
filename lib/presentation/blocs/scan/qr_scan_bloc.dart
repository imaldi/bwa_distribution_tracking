import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/bulk_scan_params.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/bulk_qr_scan.dart';
import 'package:equatable/equatable.dart';

part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QRScanBloc extends Bloc<QRScanEvent, QRScanState> {
  BulkQRScanUseCase bulkQRScanUseCase;
  QRScanBloc({
    required this.bulkQRScanUseCase,
  }) : super(QRScanInitial()) {
    on<BulkQRScanEvent>((event, emit) async {
      emit(QRScanLoading());

      var failOrLoaded = await bulkQRScanUseCase(BulkScanParams(event.qrcodeSj));

      var currentState = failOrLoaded.fold(
              (failure) => QRScanFailed(failure),
              (bulkScanResponse) => QRBulkScanSuccess(bulkScanResponse));
      emit(currentState);
    });
    on<MunculkanToastEvent>((event,emit) async {
      emit(QRScanLoading());
      print("current state is: ${state}");
      await Future.delayed(const Duration(seconds: 2));
      print("MunculkanToastEvent is called");
      emit(ToastMunculState());
      print("current state is: ${state}");
    });
  }
}
