// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_scan_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendScanDataModel _$$_SendScanDataModelFromJson(Map<String, dynamic> json) =>
    _$_SendScanDataModel(
      id: json['id'] as String?,
      nosj: json['nosj'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      alamat: json['alamat'] as String?,
      kota: json['kota'] as String?,
      keterangan: json['keterangan'] as String?,
      statusPengiriman: json['status_pengiriman'] as String?,
      foto: json['foto'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      qrCodeSJ: json['qrcode_sj'] as String?,
    );

Map<String, dynamic> _$$_SendScanDataModelToJson(
        _$_SendScanDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'alamat': instance.alamat,
      'kota': instance.kota,
      'keterangan': instance.keterangan,
      'status_pengiriman': instance.statusPengiriman,
      'foto': instance.foto,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'qrcode_sj': instance.qrCodeSJ,
    };
