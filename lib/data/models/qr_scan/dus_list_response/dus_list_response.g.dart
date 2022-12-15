// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dus_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DusListResponse _$$_DusListResponseFromJson(Map<String, dynamic> json) =>
    _$_DusListResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DusData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DusListResponseToJson(_$_DusListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$_DusData _$$_DusDataFromJson(Map<String, dynamic> json) => _$_DusData(
      id: json['id'] as int?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      nodus: json['nodus'] as String?,
      foto: json['foto'],
      idLocation: json['id_location'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_DusDataToJson(_$_DusData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'nodus': instance.nodus,
      'foto': instance.foto,
      'id_location': instance.idLocation,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
