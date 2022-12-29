// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_scan_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SendScanDataModelAdapter extends TypeAdapter<_$_SendScanDataModel> {
  @override
  final int typeId = 6;

  @override
  _$_SendScanDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SendScanDataModel(
      id: fields[0] as int?,
      nosj: fields[1] as String?,
      latitude: fields[2] as String?,
      longtitude: fields[3] as String?,
      alamat: fields[4] as String?,
      kota: fields[5] as String?,
      keterangan: fields[6] as String?,
      statusPengiriman: fields[7] as String?,
      foto: fields[8] as String?,
      createdBy: fields[9] as String?,
      updatedBy: fields[10] as String?,
      updatedAt: fields[11] as DateTime?,
      createdAt: fields[12] as DateTime?,
      qrCodeSJ: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SendScanDataModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nosj)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longtitude)
      ..writeByte(4)
      ..write(obj.alamat)
      ..writeByte(5)
      ..write(obj.kota)
      ..writeByte(6)
      ..write(obj.keterangan)
      ..writeByte(7)
      ..write(obj.statusPengiriman)
      ..writeByte(8)
      ..write(obj.foto)
      ..writeByte(9)
      ..write(obj.createdBy)
      ..writeByte(10)
      ..write(obj.updatedBy)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.qrCodeSJ);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendScanDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendScanDataModel _$$_SendScanDataModelFromJson(Map<String, dynamic> json) =>
    _$_SendScanDataModel(
      id: json['id'] as int?,
      nosj: json['nosj'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      alamat: json['alamat'] as String?,
      kota: json['kota'] as String?,
      keterangan: json['keterangan'] as String?,
      statusPengiriman: json['status_pengiriman'] as String?,
      foto: json['foto'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      qrCodeSJ: json['qrcode_sj'] as String?,
    );

Map<String, dynamic> _$$_SendScanDataModelToJson(
        _$_SendScanDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nosj': instance.nosj,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'alamat': instance.alamat,
      'kota': instance.kota,
      'keterangan': instance.keterangan,
      'status_pengiriman': instance.statusPengiriman,
      'foto': instance.foto,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'qrcode_sj': instance.qrCodeSJ,
    };
