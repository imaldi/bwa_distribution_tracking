import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/params/store_selesai_param.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../domain/usecases/scan_qr/scan_dus/send_reques_store_selesai_use_case.dart';


part 'single_scan_screen_event.dart';
part 'single_scan_screen_state.dart';

class SingleScanScreenBloc extends Bloc<SingleScanScreenEvent, SingleScanScreenState> {
  SendRequesStoreSelesaiUseCase _sendRequesStoreSelesaiUseCase;
  SingleScanScreenBloc(this._sendRequesStoreSelesaiUseCase) : super(SingleScanScreenInitial()) {
    on<SendRequesStoreSelesai>((event, emit) async {
      emit(SingleScanScreenLoading());
      var failOrLoaded = await _sendRequesStoreSelesaiUseCase(StoreSelesaiParam(event.storeSelesaiResponse));

      var currentState = failOrLoaded.fold((failure) => SingleScanScreenFailed(failure),
              (sendScanResponse) => SingleScanScreenSuccess(sendScanResponse));
      emit(currentState);
    });
  }
}
