import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kabupaten_kota_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kecamatan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kelurahan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/province_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/error/failures.dart';

abstract class ApiWilayahIndonesiaRepository {
  Future<Either<Failure, List<ProvinceResponse>>> getProvinsi();
  Future<Either<Failure, List<KabupatenKotaResponse>>> getKabupaten(int id);
  Future<Either<Failure, List<KecamatanResponse>>> getKecamatan(int id);
  Future<Either<Failure, List<KelurahanResponse>>> getKelurahan(int id);
}
