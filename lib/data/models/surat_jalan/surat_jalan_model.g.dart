// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat_jalan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SuratJalanModel _$$_SuratJalanModelFromJson(Map<String, dynamic> json) =>
    _$_SuratJalanModel(
      id: json['id'] as int?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      total: json['total'] as String?,
      onproses: json['onproses'] as String?,
      selesai: json['selesai'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_SuratJalanModelToJson(_$_SuratJalanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'total': instance.total,
      'onproses': instance.onproses,
      'selesai': instance.selesai,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
