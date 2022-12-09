part of 'wilayah_indonesia_cubit.dart';

class WilayahIndonesiaState extends Equatable {
  ProvinceResponse? provinceResponse;
  KabupatenKotaResponse? kabupatenKotaResponse;
  KecamatanResponse? kecamatanResponse;
  KelurahanResponse? kelurahanResponse;

  WilayahIndonesiaState({
    this.provinceResponse,
    this.kabupatenKotaResponse,
    this.kecamatanResponse,
    this.kelurahanResponse,
  });

  WilayahIndonesiaState copyWith({
    provinceResponse,
    kabupatenKotaResponse,
    kecamatanResponse,
    kelurahanResponse,
  }){
    return WilayahIndonesiaState(
      provinceResponse: provinceResponse ?? this.provinceResponse,
      kabupatenKotaResponse: kabupatenKotaResponse ?? this.kabupatenKotaResponse,
      kecamatanResponse: kecamatanResponse ?? this.kecamatanResponse,
      kelurahanResponse: kelurahanResponse ?? this.kelurahanResponse,
    );
  }

  @override
  List<Object?> get props => [
        provinceResponse,
        kabupatenKotaResponse,
        kecamatanResponse,
        kelurahanResponse,
      ];
}
