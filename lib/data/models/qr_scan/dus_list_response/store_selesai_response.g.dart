// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_selesai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreSelesaiResponse _$$_StoreSelesaiResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StoreSelesaiResponse(
      success: json['success'] as bool?,
      header: json['header'] == null
          ? const StoreSelesaiHeader()
          : StoreSelesaiHeader.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreSelesaiResponseToJson(
        _$_StoreSelesaiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'header': instance.header,
    };
