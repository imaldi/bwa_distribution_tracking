// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_data_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NormalDataClassAdapter extends TypeAdapter<NormalDataClass> {
  @override
  final int typeId = 4;

  @override
  NormalDataClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NormalDataClass(
      name: fields[0] as String,
      country: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NormalDataClass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NormalDataClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
