// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_user_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScanUserHistoryResponse _$$_ScanUserHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ScanUserHistoryResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SendScanDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScanUserHistoryResponseToJson(
        _$_ScanUserHistoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
