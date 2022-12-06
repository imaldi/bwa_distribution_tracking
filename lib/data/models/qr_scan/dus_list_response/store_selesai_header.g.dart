// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_selesai_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreSelesaiHeader _$$_StoreSelesaiHeaderFromJson(
        Map<String, dynamic> json) =>
    _$_StoreSelesaiHeader(
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      locationId: json['location_id'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      namaPenerima: json['nama_penerima'] as String?,
      noHp: json['no_hp'] as String?,
      lembaga: json['lembaga'] as String?,
      nmTempat: json['nm_tempat'] as String?,
      detailTempat: json['detail_tempat'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kabupaten: json['kabupaten'] as String?,
      provinsi: json['provinsi'] as String?,
      statusPengiriman: json['status_pengiriman'] as String?,
      foto: json['foto'],
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_StoreSelesaiHeaderToJson(
        _$_StoreSelesaiHeader instance) =>
    <String, dynamic>{
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'location_id': instance.locationId,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'nama_penerima': instance.namaPenerima,
      'no_hp': instance.noHp,
      'lembaga': instance.lembaga,
      'nm_tempat': instance.nmTempat,
      'detail_tempat': instance.detailTempat,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'kabupaten': instance.kabupaten,
      'provinsi': instance.provinsi,
      'status_pengiriman': instance.statusPengiriman,
      'foto': instance.foto,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
