// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendScanResponse _$$_SendScanResponseFromJson(Map<String, dynamic> json) =>
    _$_SendScanResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : SendScanDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SendScanResponseToJson(_$_SendScanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
