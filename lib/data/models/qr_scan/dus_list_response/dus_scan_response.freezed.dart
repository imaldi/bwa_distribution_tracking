// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dus_scan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DusScanResponse _$DusScanResponseFromJson(Map<String, dynamic> json) {
  return _DusScanResponse.fromJson(json);
}

/// @nodoc
mixin _$DusScanResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data_dus")
  DusData? get dataDus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusScanResponseCopyWith<DusScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusScanResponseCopyWith<$Res> {
  factory $DusScanResponseCopyWith(
          DusScanResponse value, $Res Function(DusScanResponse) then) =
      _$DusScanResponseCopyWithImpl<$Res, DusScanResponse>;
  @useResult
  $Res call(
      {bool? success,
      String? message,
      @JsonKey(name: "data_dus") DusData? dataDus});

  $DusDataCopyWith<$Res>? get dataDus;
}

/// @nodoc
class _$DusScanResponseCopyWithImpl<$Res, $Val extends DusScanResponse>
    implements $DusScanResponseCopyWith<$Res> {
  _$DusScanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? dataDus = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      dataDus: freezed == dataDus
          ? _value.dataDus
          : dataDus // ignore: cast_nullable_to_non_nullable
              as DusData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DusDataCopyWith<$Res>? get dataDus {
    if (_value.dataDus == null) {
      return null;
    }

    return $DusDataCopyWith<$Res>(_value.dataDus!, (value) {
      return _then(_value.copyWith(dataDus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DusScanResponseCopyWith<$Res>
    implements $DusScanResponseCopyWith<$Res> {
  factory _$$_DusScanResponseCopyWith(
          _$_DusScanResponse value, $Res Function(_$_DusScanResponse) then) =
      __$$_DusScanResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? message,
      @JsonKey(name: "data_dus") DusData? dataDus});

  @override
  $DusDataCopyWith<$Res>? get dataDus;
}

/// @nodoc
class __$$_DusScanResponseCopyWithImpl<$Res>
    extends _$DusScanResponseCopyWithImpl<$Res, _$_DusScanResponse>
    implements _$$_DusScanResponseCopyWith<$Res> {
  __$$_DusScanResponseCopyWithImpl(
      _$_DusScanResponse _value, $Res Function(_$_DusScanResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? dataDus = freezed,
  }) {
    return _then(_$_DusScanResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      dataDus: freezed == dataDus
          ? _value.dataDus
          : dataDus // ignore: cast_nullable_to_non_nullable
              as DusData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DusScanResponse implements _DusScanResponse {
  const _$_DusScanResponse(
      {this.success, this.message, @JsonKey(name: "data_dus") this.dataDus});

  factory _$_DusScanResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DusScanResponseFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  @JsonKey(name: "data_dus")
  final DusData? dataDus;

  @override
  String toString() {
    return 'DusScanResponse(success: $success, message: $message, dataDus: $dataDus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DusScanResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.dataDus, dataDus) || other.dataDus == dataDus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, dataDus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusScanResponseCopyWith<_$_DusScanResponse> get copyWith =>
      __$$_DusScanResponseCopyWithImpl<_$_DusScanResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusScanResponseToJson(
      this,
    );
  }
}

abstract class _DusScanResponse implements DusScanResponse {
  const factory _DusScanResponse(
      {final bool? success,
      final String? message,
      @JsonKey(name: "data_dus") final DusData? dataDus}) = _$_DusScanResponse;

  factory _DusScanResponse.fromJson(Map<String, dynamic> json) =
      _$_DusScanResponse.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(name: "data_dus")
  DusData? get dataDus;
  @override
  @JsonKey(ignore: true)
  _$$_DusScanResponseCopyWith<_$_DusScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
