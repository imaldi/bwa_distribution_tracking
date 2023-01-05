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
      qrcodeSj: json['qrcodeSj'] as String?,
      nodus: json['nodus'] as String?,
      foto: json['foto'] as String?,
      idLocation: json['idLocation'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_DusdetailToJson(_$_Dusdetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'qrcodeSj': instance.qrcodeSj,
      'nodus': instance.nodus,
      'foto': instance.foto,
      'idLocation': instance.idLocation,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_Dushead _$$_DusheadFromJson(Map<String, dynamic> json) => _$_Dushead(
      id: json['id'] as int?,
      locationId: json['locationId'] as String?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcodeSj'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      namaPenerima: json['namaPenerima'] as String?,
      noHp: json['noHp'] as String?,
      lembaga: json['lembaga'] as String?,
      nmTempat: json['nmTempat'] as String?,
      detailTempat: json['detailTempat'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kabupaten: json['kabupaten'] as String?,
      provinsi: json['provinsi'] as String?,
      statusPengiriman: json['statusPengiriman'] as String?,
      foto: json['foto'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_DusheadToJson(_$_Dushead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'nosj': instance.nosj,
      'qrcodeSj': instance.qrcodeSj,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'namaPenerima': instance.namaPenerima,
      'noHp': instance.noHp,
      'lembaga': instance.lembaga,
      'nmTempat': instance.nmTempat,
      'detailTempat': instance.detailTempat,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'kabupaten': instance.kabupaten,
      'provinsi': instance.provinsi,
      'statusPengiriman': instance.statusPengiriman,
      'foto': instance.foto,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
