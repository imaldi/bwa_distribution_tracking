// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dus_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DusDetailResponse _$$_DusDetailResponseFromJson(Map<String, dynamic> json) =>
    _$_DusDetailResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      dushead: (json['dushead'] as List<dynamic>?)
          ?.map((e) => Dushead.fromJson(e as Map<String, dynamic>))
          .toList(),
      dusdetail: (json['dusdetail'] as List<dynamic>?)
          ?.map((e) => Dusdetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DusDetailResponseToJson(
        _$_DusDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'dushead': instance.dushead,
      'dusdetail': instance.dusdetail,
    };

_$_Dusdetail _$$_DusdetailFromJson(Map<String, dynamic> json) => _$_Dusdetail(
      id: json['id'] as int?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      nodus: json['nodus'] as String?,
      foto: json['foto'] as String?,
      idLocation: json['id_location'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_DusdetailToJson(_$_Dusdetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'nodus': instance.nodus,
      'foto': instance.foto,
      'id_location': instance.idLocation,
      'createdBy': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$_Dushead _$$_DusheadFromJson(Map<String, dynamic> json) => _$_Dushead(
      id: json['id'] as int?,
      locationId: json['location_id'] as String?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      namaPenerima: json['nama_penerima'] as String?,
      noHp: json['no_hp'] as String?,
      lembaga: json['lembaga'] as String?,
      nmTempat: json['nmTempat'] as String?,
      detailTempat: json['detail_tempat'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kabupaten: json['kabupaten'] as String?,
      provinsi: json['provinsi'] as String?,
      statusPengiriman: json['status_pengiriman'] as String?,
      foto: json['foto'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_DusheadToJson(_$_Dushead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.locationId,
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'nama_penerima': instance.namaPenerima,
      'no_hp': instance.noHp,
      'lembaga': instance.lembaga,
      'nmTempat': instance.nmTempat,
      'detail_tempat': instance.detailTempat,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'kabupaten': instance.kabupaten,
      'provinsi': instance.provinsi,
      'status_pengiriman': instance.statusPengiriman,
      'foto': instance.foto,
      'createdBy': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
