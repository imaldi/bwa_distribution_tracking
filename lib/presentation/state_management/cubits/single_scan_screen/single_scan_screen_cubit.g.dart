// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_scan_screen_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleScanScreenState _$$_SingleScanScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_SingleScanScreenState(
      dusListResponse: json['dusListResponse'] == null
          ? null
          : DusListResponse.fromJson(
              json['dusListResponse'] as Map<String, dynamic>),
      dusScanResponse: json['dusScanResponse'] == null
          ? null
          : DusScanResponse.fromJson(
              json['dusScanResponse'] as Map<String, dynamic>),
      qrCodeAndPhotoPathMap:
          (json['qrCodeAndPhotoPathMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      storeSelesaiResponse: json['storeSelesaiResponse'] == null
          ? const StoreSelesaiResponse()
          : StoreSelesaiResponse.fromJson(
              json['storeSelesaiResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SingleScanScreenStateToJson(
        _$_SingleScanScreenState instance) =>
    <String, dynamic>{
      'dusListResponse': instance.dusListResponse,
      'dusScanResponse': instance.dusScanResponse,
      'qrCodeAndPhotoPathMap': instance.qrCodeAndPhotoPathMap,
      'storeSelesaiResponse': instance.storeSelesaiResponse,
    };
