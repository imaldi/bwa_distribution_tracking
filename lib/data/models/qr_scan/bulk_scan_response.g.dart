// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BulkScanResponse _$$_BulkScanResponseFromJson(Map<String, dynamic> json) =>
    _$_BulkScanResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      header: (json['header'] as List<dynamic>?)
          ?.map((e) => SuratJalanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BulkQRScanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      detail: json['detail'] == null
          ? null
          : BulkScanQrDetailPerPage.fromJson(
              json['detail'] as Map<String, dynamic>),
      nosjhistory: (json['nosjhistory'] as List<dynamic>?)
          ?.map((e) => SendScanDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BulkScanResponseToJson(_$_BulkScanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'header': instance.header?.map((e) => e.toJson()).toList(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'detail': instance.detail?.toJson(),
      'nosjhistory': instance.nosjhistory?.map((e) => e.toJson()).toList(),
    };
