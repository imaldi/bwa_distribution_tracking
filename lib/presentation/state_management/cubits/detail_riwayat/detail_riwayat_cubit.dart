import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/params/location_address_params.dart';
import '../../../../data/models/qr_scan/dus_detail_response.dart';
import '../../../../domain/repositories/surat_jalan_repository.dart';
import '../../../../domain/usecases/geolocator/get_current_address.dart';

part 'detail_riwayat_state.dart';

class DetailRiwayatCubit extends Cubit<DetailRiwayatState> {
  final SuratJalanRepository _suratJalanRepository;
  final GetCurrentAddressUseCase _getCurrentAddressUseCase;
  DetailRiwayatCubit(this._suratJalanRepository,this._getCurrentAddressUseCase) : super(const DetailRiwayatState(DusDetailResponse()));

  getDusDetailResponse(String qrCode) async {
   var result = await _suratJalanRepository.getDusDetailByQrCodeSJ(qrCode);
   var newState = result.fold((l) => const DetailRiwayatState(DusDetailResponse()), (r) {
     getAddress(double.parse(r.dushead?.first.latitude ?? "0.0"), double.parse(r.dushead?.first.longtitude ?? "0.0"));
     return DetailRiwayatState(r);
   });
   emit(newState);
  }

  getAddress(double lat, double long) async {
    var eitherPositionOrFailure = await _getCurrentAddressUseCase(LocationAddressParams(latitude: lat, longitude: long));
    var newState = eitherPositionOrFailure.fold(
            (l) => state.copyWith(address: ""),
            (r) => state.copyWith(
            address: r.displayName
        ));
    emit(newState);
  }
}
