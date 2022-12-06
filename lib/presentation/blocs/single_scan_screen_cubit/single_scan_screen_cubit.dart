import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_list_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/qr_scan/dus_list_response/store_selesai_header.dart';

part 'single_scan_screen_cubit.freezed.dart';

part 'single_scan_screen_cubit.g.dart';

part 'single_scan_screen_state.dart';

class SingleScanScreenCubit extends Cubit<SingleScanScreenCubitState> {
  SingleScanScreenCubit() : super(const SingleScanScreenCubitState());

  void updateStoreSelesaiResponse(
      StoreSelesaiHeader Function(StoreSelesaiHeader) callback) {
    // var a = state.storeSelesaiResponse?.copyWith(success: false);
    // emit(state.copyWith.storeSelesaiResponse?(header: callback(state.storeSelesaiResponse?.header ?? const StoreSelesaiHeader())));
    // emit(state.copyWith(
    //     storeSelesaiResponse: state.storeSelesaiResponse?.copyWith(
    //         header: callback(state.storeSelesaiResponse?.header ??
    //             const StoreSelesaiHeader()))));

    /// brati bukan salah disini
    emit(state.copyWith.storeSelesaiResponse!(
        header: callback(
            state.storeSelesaiResponse?.header ?? const StoreSelesaiHeader())));
    print("nama pengguna: ${state.storeSelesaiResponse?.header?.namaPenerima ?? "koossoongg"}");
    print("status pengiriman: ${state.storeSelesaiResponse?.header?.statusPengiriman ?? "belum pilih"}");
  }
}
