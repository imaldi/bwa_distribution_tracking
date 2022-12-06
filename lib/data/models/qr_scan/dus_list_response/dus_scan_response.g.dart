// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dus_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DusScanResponse _$$_DusScanResponseFromJson(Map<String, dynamic> json) =>
    _$_DusScanResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      dataDus: json['data_dus'] == null
          ? null
          : DusData.fromJson(json['data_dus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DusScanResponseToJson(_$_DusScanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data_dus': instance.dataDus,
    };
