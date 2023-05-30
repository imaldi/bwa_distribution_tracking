import 'dart:convert';

import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kabupaten_kota_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kecamatan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/kelurahan_model.dart';
import 'package:bwa_distribution_tracking/data/models/wilayah_indonesia_api/province_model.dart';
import 'package:bwa_distribution_tracking/domain/repositories/api_wilayah_indonesia.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/error/exceptions.dart';

class ApiWilayahIndonesiaRepositoryImpl extends ApiWilayahIndonesiaRepository {
  @override
  Future<Either<Failure, List<KabupatenKotaResponse>>> getKabupaten(
      int id) async {
    try {
      var url =
          Uri.http(baseWilayahApi, "$kabupatenKotaUrl/$id$jsonEndingPrefix");
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var theResponse = kabupatenKotaResponseFromJson(response.body);
        var isResponseDataNull = theResponse.isEmpty;
        if (isResponseDataNull) {
          throw ServerException();
        }
        return Right(theResponse);
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KecamatanResponse>>> getKecamatan(int id) async {
    try {
      var url = Uri.http(baseWilayahApi, "$kecamatanUrl/$id$jsonEndingPrefix");
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var theResponse = kecamatanResponseFromJson(response.body);
        var isResponseDataNull = theResponse.isEmpty;
        if (isResponseDataNull) {
          throw ServerException();
        }
        return Right(theResponse);
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KelurahanResponse>>> getKelurahan(int id) async {
    try {
      var url = Uri.http(baseWilayahApi, "$kelurahanUrl/$id$jsonEndingPrefix");
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var theResponse = kelurahanResponseFromJson(response.body);
        var isResponseDataNull = theResponse.length == 0;
        if (isResponseDataNull) {
          throw ServerException();
        }
        return Right(theResponse);
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProvinceResponse>>> getProvinsi() async {
    try {
      var url = Uri.http(baseWilayahApi, provinceUrl);
      print("url province: ${url}");
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var theResponse = provinceResponseFromJson(response.body);
        var isResponseDataNull = theResponse.length == 0;
        if (isResponseDataNull) {
          throw ServerException();
        }
        return Right(theResponse);
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
