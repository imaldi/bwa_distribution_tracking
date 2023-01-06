import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/qr_scan/dus_detail_response.dart';
import '../../../../domain/repositories/surat_jalan_repository.dart';

part 'detail_riwayat_state.dart';

class DetailRiwayatCubit extends Cubit<DetailRiwayatState> {
  final SuratJalanRepository _suratJalanRepository;
  DetailRiwayatCubit(this._suratJalanRepository) : super(const DetailRiwayatState(DusDetailResponse()));

  getDusDetailResponse(String qrCode) async {
   var result = await _suratJalanRepository.getDusDetailByQrCodeSJ(qrCode);
   var newState = result.fold((l) => const DetailRiwayatState(DusDetailResponse()), (r) => DetailRiwayatState(r));
   emit(newState);
  }
}
