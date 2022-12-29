import 'package:freezed_annotation/freezed_annotation.dart';

part 'box_q_r_scan_model.freezed.dart';
part 'box_q_r_scan_model.g.dart';

@freezed
class BoxQRScanModel with _$BoxQRScanModel {
  // @HiveType(typeId: boxQRScanModelTypeId,adapterName: 'BoxQRScanModelAdapter')
  const factory BoxQRScanModel({
    int? id,
    String? notrans,
    String? nosj,
    @JsonKey(name: 'kode_batch') String? kodeBatch,
    @JsonKey(name: 'nm_project') String? nmProject,
    @JsonKey(name: 'jenis_quran') String? jenisQuran,
    @JsonKey(name: 'jml_keluar') String? jmlKeluar,
    String? vendor,
    String? warehouse,
    String? status,
    @JsonKey(name: 'jenis_reject') String? jenisReject,
    String? keterangan,
    String? approval,
    String? nopc,
    String? upload,
    @JsonKey(name: 'tgl_diajukan') String? tglDiajukan,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'updated_by') String? updatedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _BoxQRScanModel;

  factory BoxQRScanModel.fromJson(Map<String, Object?> json) =>
      _$BoxQRScanModelFromJson(json);
}
