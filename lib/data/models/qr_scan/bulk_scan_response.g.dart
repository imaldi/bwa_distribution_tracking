// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BulkScanResponse _$$_BulkScanResponseFromJson(Map<String, dynamic> json) =>
    _$_BulkScanResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BulkQRScanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => BoxQRScanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BulkScanResponseToJson(_$_BulkScanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'detail': instance.detail?.map((e) => e.toJson()).toList(),
    };