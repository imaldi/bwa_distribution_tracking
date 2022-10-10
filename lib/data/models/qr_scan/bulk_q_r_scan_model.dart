import 'package:freezed_annotation/freezed_annotation.dart';


part 'bulk_q_r_scan_model.freezed.dart';
part 'bulk_q_r_scan_model.g.dart';

@freezed
class BulkQRScanModel with _$BulkQRScanModel{

  const factory BulkQRScanModel({
  int? id,
  String? nosj,
  @JsonKey(name: 'qrcode_sj')
  String? qrcodeSj,
  String? nopc,
  @JsonKey(name: 'kode_batch')
  String? kodeBatch,
  String? alamat,
  String? pic,
  @JsonKey(name: 'pic_telp')
  String? picTelp,
  String? tanggal,
  @JsonKey(name: 'dikirim_by')
  String? dikirimBy,
  String? nopol,
  @JsonKey(name: 'nm_pengemudi')
  String? nmPengemudi,
  String? notelp,
  String? approval,
  String? total,
  String? kg,
  @JsonKey(name: 'ttd_ga')
  String? ttdGa,
  @JsonKey(name: 'ttd_wl')
  String? ttdWl,
  @JsonKey(name: 'created_by')
  String? createdBy,
  @JsonKey(name: 'updated_by')
  String? updatedBy,
  @JsonKey(name: 'created_at')
  DateTime? createdAt,
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt,
  }) = _BulkQRScanModel;

  factory BulkQRScanModel.fromJson(Map<String, Object?> json)
  => _$BulkQRScanModelFromJson(json);
}