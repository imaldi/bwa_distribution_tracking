import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'send_scan_data_model.freezed.dart';
part 'send_scan_data_model.g.dart';

@freezed
class SendScanDataModel with _$SendScanDataModel {
  // tes lag
  @HiveType(
      typeId: sendScanDataModelTypeId, adapterName: 'SendScanDataModelAdapter')
  const factory SendScanDataModel({
    @HiveField(0) int? id,
    @HiveField(1) String? nosj,
    @HiveField(2) String? latitude,
    @HiveField(3) String? longtitude,
    @HiveField(4) String? alamat,
    @HiveField(5) String? kota,
    @HiveField(6) String? keterangan,
    @HiveField(7) @JsonKey(name: 'status_pengiriman') String? statusPengiriman,
    @HiveField(8) String? foto,
    @HiveField(9) @JsonKey(name: 'created_by') String? createdBy,
    @HiveField(10) @JsonKey(name: 'updated_by') String? updatedBy,
    @HiveField(11) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @HiveField(12) @JsonKey(name: 'created_at') DateTime? createdAt,
    @HiveField(13) @JsonKey(name: 'qrcode_sj') String? qrCodeSJ,
  }) = _SendScanDataModel;

  factory SendScanDataModel.fromJson(Map<String, Object?> json) =>
      _$SendScanDataModelFromJson(json);
}
