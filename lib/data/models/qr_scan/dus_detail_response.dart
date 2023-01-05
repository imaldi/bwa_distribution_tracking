// To parse this JSON data, do
//
//     final dusDetailResponse = dusDetailResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'dus_detail_response.freezed.dart';
part 'dus_detail_response.g.dart';

DusDetailResponse dusDetailResponseFromJson(String str) => DusDetailResponse.fromJson(json.decode(str));

String dusDetailResponseToJson(DusDetailResponse data) => json.encode(data.toJson());

@freezed
class DusDetailResponse with _$DusDetailResponse {
  const factory DusDetailResponse({
    bool? success,
    String? message,
    List<Dushead>? dushead,
    List<Dusdetail>? dusdetail,
  }) = _DusDetailResponse;

  factory DusDetailResponse.fromJson(Map<String, dynamic> json) => _$DusDetailResponseFromJson(json);
}

@freezed
class Dusdetail with _$Dusdetail {
  const factory Dusdetail({
    int? id,
    String? nosj,
    String? qrcodeSj,
    String? nodus,
    String? foto,
    String? idLocation,
    String? createdBy,
    String? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Dusdetail;

  factory Dusdetail.fromJson(Map<String, dynamic> json) => _$DusdetailFromJson(json);
}

@freezed
class Dushead with _$Dushead {
  const factory Dushead({
    int? id,
    String? locationId,
    String? nosj,
    String? qrcodeSj,
    String? latitude,
    String? longtitude,
    String? namaPenerima,
    String? noHp,
    String? lembaga,
    String? nmTempat,
    String? detailTempat,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    String? statusPengiriman,
    String? foto,
    String? createdBy,
    String? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Dushead;

  factory Dushead.fromJson(Map<String, dynamic> json) => _$DusheadFromJson(json);
}