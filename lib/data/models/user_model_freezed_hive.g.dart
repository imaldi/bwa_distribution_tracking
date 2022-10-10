// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_freezed_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelFreezedHiveAdapter extends TypeAdapter<_$_UserModelFreezedHive> {
  @override
  final int typeId = 5;

  @override
  _$_UserModelFreezedHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserModelFreezedHive(
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      age: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserModelFreezedHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelFreezedHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModelFreezedHive _$$_UserModelFreezedHiveFromJson(
        Map<String, dynamic> json) =>
    _$_UserModelFreezedHive(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UserModelFreezedHiveToJson(
        _$_UserModelFreezedHive instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
    };
