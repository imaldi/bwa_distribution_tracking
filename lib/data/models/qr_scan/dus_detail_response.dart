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
    @JsonKey(name: "qrcode_sj") String? qrcodeSj,
    String? nodus,
    String? foto,
    @JsonKey(name: "id_location") String? idLocation,
    @JsonKey(name: "createdBy")  String? createdBy,
    @JsonKey(name: "updated_by") String? updatedBy,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Dusdetail;

  factory Dusdetail.fromJson(Map<String, dynamic> json) => _$DusdetailFromJson(json);
}

@freezed
class Dushead with _$Dushead {
  const factory Dushead({
    int? id,
    @JsonKey(name: "location_id") String? locationId,
    String? nosj,
    @JsonKey(name: "qrcode_sj") String? qrcodeSj,
    String? latitude,
    String? longtitude,
    @JsonKey(name: "nama_penerima") String? namaPenerima,
    @JsonKey(name: "no_hp") String? noHp,
    String? lembaga,
    String? nmTempat,
    @JsonKey(name: "detail_tempat")String? detailTempat,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    @JsonKey(name: "status_pengiriman") String? statusPengiriman,
    String? foto,
    @JsonKey(name: "createdBy") String? createdBy,
    @JsonKey(name: "updated_by") String? updatedBy,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Dushead;

  factory Dushead.fromJson(Map<String, dynamic> json) => _$DusheadFromJson(json);
}