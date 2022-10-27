// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_q_r_scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BulkQRScanModel _$$_BulkQRScanModelFromJson(Map<String, dynamic> json) =>
    _$_BulkQRScanModel(
      id: json['id'] as String?,
      nosj: json['nosj'] as String?,
      qrcodeSj: json['qrcode_sj'] as String?,
      nopc: json['nopc'] as String?,
      kodeBatch: json['kode_batch'] as String?,
      alamat: json['alamat'] as String?,
      pic: json['pic'] as String?,
      picTelp: json['pic_telp'] as String?,
      tanggal: json['tanggal'] as String?,
      dikirimBy: json['dikirim_by'] as String?,
      nopol: json['nopol'] as String?,
      nmPengemudi: json['nm_pengemudi'] as String?,
      notelp: json['notelp'] as String?,
      approval: json['approval'] as String?,
      total: json['total'] as String?,
      kg: json['kg'] as String?,
      ttdGa: json['ttd_ga'] as String?,
      ttdWl: json['ttd_wl'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_BulkQRScanModelToJson(_$_BulkQRScanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'qrcode_sj': instance.qrcodeSj,
      'nopc': instance.nopc,
      'kode_batch': instance.kodeBatch,
      'alamat': instance.alamat,
      'pic': instance.pic,
      'pic_telp': instance.picTelp,
      'tanggal': instance.tanggal,
      'dikirim_by': instance.dikirimBy,
      'nopol': instance.nopol,
      'nm_pengemudi': instance.nmPengemudi,
      'notelp': instance.notelp,
      'approval': instance.approval,
      'total': instance.total,
      'kg': instance.kg,
      'ttd_ga': instance.ttdGa,
      'ttd_wl': instance.ttdWl,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
