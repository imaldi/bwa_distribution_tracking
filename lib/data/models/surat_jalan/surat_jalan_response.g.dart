// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat_jalan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SuratJalanResponse _$$_SuratJalanResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SuratJalanResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SuratJalanRespData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SuratJalanResponseToJson(
        _$_SuratJalanResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
