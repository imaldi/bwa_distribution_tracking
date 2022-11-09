import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/bulk_scan_params.dart';
import 'package:bwa_distribution_tracking/core/params/send_scan_params.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/bulk_qr_scan.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/get_user_scan_history.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/send_qr_scan.dart';
import 'package:equatable/equatable.dart';

part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QRScanBloc extends Bloc<QRScanEvent, QRScanState> {
  final BulkQRScanUseCase _bulkQRScanUseCase;
  // FIXME ada error kalau ngambil foto dua kali atau ganti orientasi layar
  final SendScanUseCase _sendScanUseCase;
  QRScanBloc(this._bulkQRScanUseCase, this._sendScanUseCase)
      : super(QRScanInitial()) {
    on<BulkQRScanEvent>((event, emit) async {
      emit(QRScanLoading());

      var failOrLoaded =
          await _bulkQRScanUseCase(BulkScanParams(event.qrcodeSj));

      var currentState = failOrLoaded.fold((failure) => QRScanFailed(failure),
          (bulkScanResponse) => QRBulkScanSuccess(bulkScanResponse));
      emit(currentState);
    });
    on<SendScanEvent>((event, emit) async {
      emit(QRScanLoading());

      var failOrLoaded = await _sendScanUseCase(SendScanParams(event.model));

      var currentState = failOrLoaded.fold((failure) => QRScanFailed(failure),
          (sendScanResponse) => SendScanSuccess(sendScanResponse));
      emit(currentState);
    });

    on<MunculkanToastEvent>((event, emit) async {
      emit(QRScanLoading());
      print("current state is: $state");
      await Future.delayed(const Duration(seconds: 2));
      print("MunculkanToastEvent is called");
      emit(const ToastMunculState());
      print("current state is: $state");
    });
  }
}
