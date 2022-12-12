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
      var failureOrResult = await repository.getProvinsi();
      var provinceList = failureOrResult.fold((l) => <ProvinceResponse>[], (r) => r);
      emit(state.copyWith(provinceResponse: provinceList));
  }

  fetchKabupaten(int id) async {
    var failureOrResult = await repository.getKabupaten(id);
    var kabupatenList = failureOrResult.fold((l) => <KabupatenKotaResponse>[], (r) => r);
    emit(state.copyWith(kabupatenKotaResponse: kabupatenList));
    print("Province List: ${
        state.provinceResponse
    }");
    print("Kabupaten List: ${
      state.kabupatenKotaResponse
    }");
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
