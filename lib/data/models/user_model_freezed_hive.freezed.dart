// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model_freezed_hive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModelFreezedHive _$UserModelFreezedHiveFromJson(Map<String, dynamic> json) {
  return _UserModelFreezedHive.fromJson(json);
}

/// @nodoc
mixin _$UserModelFreezedHive {
  @HiveField(0)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelFreezedHiveCopyWith<UserModelFreezedHive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelFreezedHiveCopyWith<$Res> {
  factory $UserModelFreezedHiveCopyWith(UserModelFreezedHive value,
          $Res Function(UserModelFreezedHive) then) =
      _$UserModelFreezedHiveCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? firstName,
      @HiveField(1) String? lastName,
      @HiveField(2) int? age});
}

/// @nodoc
class _$UserModelFreezedHiveCopyWithImpl<$Res>
    implements $UserModelFreezedHiveCopyWith<$Res> {
  _$UserModelFreezedHiveCopyWithImpl(this._value, this._then);

  final UserModelFreezedHive _value;
  // ignore: unused_field
  final $Res Function(UserModelFreezedHive) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserModelFreezedHiveCopyWith<$Res>
    implements $UserModelFreezedHiveCopyWith<$Res> {
  factory _$$_UserModelFreezedHiveCopyWith(_$_UserModelFreezedHive value,
          $Res Function(_$_UserModelFreezedHive) then) =
      __$$_UserModelFreezedHiveCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? firstName,
      @HiveField(1) String? lastName,
      @HiveField(2) int? age});
}

/// @nodoc
class __$$_UserModelFreezedHiveCopyWithImpl<$Res>
    extends _$UserModelFreezedHiveCopyWithImpl<$Res>
    implements _$$_UserModelFreezedHiveCopyWith<$Res> {
  __$$_UserModelFreezedHiveCopyWithImpl(_$_UserModelFreezedHive _value,
      $Res Function(_$_UserModelFreezedHive) _then)
      : super(_value, (v) => _then(v as _$_UserModelFreezedHive));

  @override
  _$_UserModelFreezedHive get _value => super._value as _$_UserModelFreezedHive;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
  }) {
    return _then(_$_UserModelFreezedHive(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: userTypeId, adapterName: 'UserModelFreezedHiveAdapter')
class _$_UserModelFreezedHive implements _UserModelFreezedHive {
  const _$_UserModelFreezedHive(
      {@HiveField(0) this.firstName,
      @HiveField(1) this.lastName,
      @HiveField(2) this.age});

  factory _$_UserModelFreezedHive.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFreezedHiveFromJson(json);

  @override
  @HiveField(0)
  final String? firstName;
  @override
  @HiveField(1)
  final String? lastName;
  @override
  @HiveField(2)
  final int? age;

  @override
  String toString() {
    return 'UserModelFreezedHive(firstName: $firstName, lastName: $lastName, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModelFreezedHive &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.age, age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(age));

  @JsonKey(ignore: true)
  @override
  _$$_UserModelFreezedHiveCopyWith<_$_UserModelFreezedHive> get copyWith =>
      __$$_UserModelFreezedHiveCopyWithImpl<_$_UserModelFreezedHive>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelFreezedHiveToJson(
      this,
    );
  }
}

abstract class _UserModelFreezedHive implements UserModelFreezedHive {
  const factory _UserModelFreezedHive(
      {@HiveField(0) final String? firstName,
      @HiveField(1) final String? lastName,
      @HiveField(2) final int? age}) = _$_UserModelFreezedHive;

  factory _UserModelFreezedHive.fromJson(Map<String, dynamic> json) =
      _$_UserModelFreezedHive.fromJson;

  @override
  @HiveField(0)
  String? get firstName;
  @override
  @HiveField(1)
  String? get lastName;
  @override
  @HiveField(2)
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelFreezedHiveCopyWith<_$_UserModelFreezedHive> get copyWith =>
      throw _privateConstructorUsedError;
}
