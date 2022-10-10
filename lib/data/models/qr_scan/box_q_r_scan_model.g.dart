// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_q_r_scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoxQRScanModel _$$_BoxQRScanModelFromJson(Map<String, dynamic> json) =>
    _$_BoxQRScanModel(
      id: json['id'] as int?,
      notrans: json['notrans'] as String?,
      nosj: json['nosj'] as String?,
      kodeBatch: json['kode_batch'] as String?,
      nmProject: json['nm_project'] as String?,
      jenisQuran: json['jenis_quran'] as String?,
      jmlKeluar: json['jml_keluar'] as String?,
      vendor: json['vendor'] as String?,
      warehouse: json['warehouse'] as String?,
      status: json['status'] as String?,
      jenisReject: json['jenis_reject'] as String?,
      keterangan: json['keterangan'] as String?,
      approval: json['approval'] as String?,
      nopc: json['nopc'] as String?,
      upload: json['upload'] as String?,
      tglDiajukan: json['tgl_diajukan'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_BoxQRScanModelToJson(_$_BoxQRScanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notrans': instance.notrans,
      'nosj': instance.nosj,
      'kode_batch': instance.kodeBatch,
      'nm_project': instance.nmProject,
      'jenis_quran': instance.jenisQuran,
      'jml_keluar': instance.jmlKeluar,
      'vendor': instance.vendor,
      'warehouse': instance.warehouse,
      'status': instance.status,
      'jenis_reject': instance.jenisReject,
      'keterangan': instance.keterangan,
      'approval': instance.approval,
      'nopc': instance.nopc,
      'upload': instance.upload,
      'tgl_diajukan': instance.tglDiajukan,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
