// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_scan_screen_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleScanScreenState _$$_SingleScanScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_SingleScanScreenState(
      isLoading: json['isLoading'] as bool? ?? false,
      dusListResponse: json['dusListResponse'] == null
          ? null
          : DusListResponse.fromJson(
              json['dusListResponse'] as Map<String, dynamic>),
      dusScanResponse: json['dusScanResponse'] == null
          ? null
          : DusScanResponse.fromJson(
              json['dusScanResponse'] as Map<String, dynamic>),
      currentDusNumber: json['currentDusNumber'] as int? ?? 1,
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
      'isLoading': instance.isLoading,
      'dusListResponse': instance.dusListResponse,
      'dusScanResponse': instance.dusScanResponse,
      'currentDusNumber': instance.currentDusNumber,
      'qrCodeAndPhotoPathMap': instance.qrCodeAndPhotoPathMap,
      'storeSelesaiResponse': instance.storeSelesaiResponse,
    };
