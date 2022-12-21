// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<_$_UserModel> {
  @override
  final int typeId = 0;

  @override
  _$_UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      foto: fields[3] as String?,
      role: fields[4] as String?,
      ttd: fields[5] as String?,
      apiToken: fields[6] as String?,
      createdAt: fields[7] as String?,
      updatedAt: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.foto)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.ttd)
      ..writeByte(6)
      ..write(obj.apiToken)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      foto: json['foto'] as String?,
      role: json['role'] as String?,
      ttd: json['ttd'] as String?,
      apiToken: json['api_token'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'foto': instance.foto,
      'role': instance.role,
      'ttd': instance.ttd,
      'api_token': instance.apiToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
