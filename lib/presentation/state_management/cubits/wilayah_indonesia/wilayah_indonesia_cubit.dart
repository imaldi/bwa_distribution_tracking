import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kabupaten_kota_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kecamatan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kelurahan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/province_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/api_wilayah_indonesia.dart';

part 'wilayah_indonesia_state.dart';

class WilayahIndonesiaCubit extends Cubit<WilayahIndonesiaState> {
  ApiWilayahIndonesiaRepository repository;
  WilayahIndonesiaCubit(this.repository) : super(WilayahIndonesiaState());
  
  initProvince() async {
      var provinceList = await repository.getProvinsi();
      emit(state.copyWith(provinceResponse: provinceList));
  }

  fetchKabupaten(int id) async {
    var kabupatenList = await repository.getKabupaten(id);
    emit(state.copyWith(kabupatenKotaResponse: kabupatenList));
  }

  fetchKecamatan(int id) async {
    var kecamatanList = await repository.getKecamatan(id);
    emit(state.copyWith(kecamatanResponse: kecamatanList));
  }
  fetchKelurahan(int id) async {
    var kelurahanList = await repository.getKelurahan(id);
    emit(state.copyWith(kabupatenKotaResponse: kelurahanList));
  }
}
