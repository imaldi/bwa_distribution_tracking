// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get foto => throw _privateConstructorUsedError; // ayolah oi
  @HiveField(4)
  String? get role => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get ttd => throw _privateConstructorUsedError;
  @JsonKey(name: "api_token")
  @HiveField(6)
  String? get apiToken => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  @HiveField(7)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  @HiveField(8)
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? name,
      @HiveField(2) String? phone,
      @HiveField(3) String? foto,
      @HiveField(4) String? role,
      @HiveField(5) String? ttd,
      @JsonKey(name: "api_token") @HiveField(6) String? apiToken,
      @JsonKey(name: "created_at") @HiveField(7) String? createdAt,
      @JsonKey(name: "updated_at") @HiveField(8) String? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? foto = freezed,
    Object? role = freezed,
    Object? ttd = freezed,
    Object? apiToken = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      ttd: freezed == ttd
          ? _value.ttd
          : ttd // ignore: cast_nullable_to_non_nullable
              as String?,
      apiToken: freezed == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? name,
      @HiveField(2) String? phone,
      @HiveField(3) String? foto,
      @HiveField(4) String? role,
      @HiveField(5) String? ttd,
      @JsonKey(name: "api_token") @HiveField(6) String? apiToken,
      @JsonKey(name: "created_at") @HiveField(7) String? createdAt,
      @JsonKey(name: "updated_at") @HiveField(8) String? updatedAt});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? foto = freezed,
    Object? role = freezed,
    Object? ttd = freezed,
    Object? apiToken = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      ttd: freezed == ttd
          ? _value.ttd
          : ttd // ignore: cast_nullable_to_non_nullable
              as String?,
      apiToken: freezed == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: userTypeId, adapterName: 'UserModelAdapter')
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@HiveField(0) this.id,
      @HiveField(1) this.name,
      @HiveField(2) this.phone,
      @HiveField(3) this.foto,
      @HiveField(4) this.role,
      @HiveField(5) this.ttd,
      @JsonKey(name: "api_token") @HiveField(6) this.apiToken,
      @JsonKey(name: "created_at") @HiveField(7) this.createdAt,
      @JsonKey(name: "updated_at") @HiveField(8) this.updatedAt});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? phone;
  @override
  @HiveField(3)
  final String? foto;
// ayolah oi
  @override
  @HiveField(4)
  final String? role;
  @override
  @HiveField(5)
  final String? ttd;
  @override
  @JsonKey(name: "api_token")
  @HiveField(6)
  final String? apiToken;
  @override
  @JsonKey(name: "created_at")
  @HiveField(7)
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  @HiveField(8)
  final String? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, phone: $phone, foto: $foto, role: $role, ttd: $ttd, apiToken: $apiToken, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.ttd, ttd) || other.ttd == ttd) &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, foto, role, ttd,
      apiToken, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@HiveField(0) final int? id,
          @HiveField(1) final String? name,
          @HiveField(2) final String? phone,
          @HiveField(3) final String? foto,
          @HiveField(4) final String? role,
          @HiveField(5) final String? ttd,
          @JsonKey(name: "api_token") @HiveField(6) final String? apiToken,
          @JsonKey(name: "created_at") @HiveField(7) final String? createdAt,
          @JsonKey(name: "updated_at") @HiveField(8) final String? updatedAt}) =
      _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get phone;
  @override
  @HiveField(3)
  String? get foto;
  @override // ayolah oi
  @HiveField(4)
  String? get role;
  @override
  @HiveField(5)
  String? get ttd;
  @override
  @JsonKey(name: "api_token")
  @HiveField(6)
  String? get apiToken;
  @override
  @JsonKey(name: "created_at")
  @HiveField(7)
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  @HiveField(8)
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
