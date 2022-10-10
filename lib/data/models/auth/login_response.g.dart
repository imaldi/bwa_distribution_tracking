// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_response;

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseAdapter extends TypeAdapter<_$_LoginResponse> {
  @override
  final int typeId = 1;

  @override
  _$_LoginResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LoginResponse(
      responseCode: fields[0] as int?,
      success: fields[1] as bool?,
      token: fields[2] as Token?,
      user: fields[3] as UserModel?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LoginResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.responseCode)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      responseCode: json['0'] as int?,
      success: json['success'] as bool?,
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      '0': instance.responseCode,
      'success': instance.success,
      'token': instance.token?.toJson(),
      'user': instance.user?.toJson(),
    };
