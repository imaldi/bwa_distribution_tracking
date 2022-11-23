// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'surat_jalan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuratJalanResponse _$SuratJalanResponseFromJson(Map<String, dynamic> json) {
  return _SuratJalanResponse.fromJson(json);
}

/// @nodoc
mixin _$SuratJalanResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SuratJalanRespData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuratJalanResponseCopyWith<SuratJalanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuratJalanResponseCopyWith<$Res> {
  factory $SuratJalanResponseCopyWith(
          SuratJalanResponse value, $Res Function(SuratJalanResponse) then) =
      _$SuratJalanResponseCopyWithImpl<$Res, SuratJalanResponse>;
  @useResult
  $Res call({bool? success, String? message, SuratJalanRespData? data});

  $SuratJalanRespDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SuratJalanResponseCopyWithImpl<$Res, $Val extends SuratJalanResponse>
    implements $SuratJalanResponseCopyWith<$Res> {
  _$SuratJalanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SuratJalanRespData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuratJalanRespDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SuratJalanRespDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SuratJalanResponseCopyWith<$Res>
    implements $SuratJalanResponseCopyWith<$Res> {
  factory _$$_SuratJalanResponseCopyWith(_$_SuratJalanResponse value,
          $Res Function(_$_SuratJalanResponse) then) =
      __$$_SuratJalanResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, SuratJalanRespData? data});

  @override
  $SuratJalanRespDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_SuratJalanResponseCopyWithImpl<$Res>
    extends _$SuratJalanResponseCopyWithImpl<$Res, _$_SuratJalanResponse>
    implements _$$_SuratJalanResponseCopyWith<$Res> {
  __$$_SuratJalanResponseCopyWithImpl(
      _$_SuratJalanResponse _value, $Res Function(_$_SuratJalanResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_SuratJalanResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SuratJalanRespData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SuratJalanResponse implements _SuratJalanResponse {
  const _$_SuratJalanResponse({this.success, this.message, this.data});

  factory _$_SuratJalanResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SuratJalanResponseFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final SuratJalanRespData? data;

  @override
  String toString() {
    return 'SuratJalanResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuratJalanResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuratJalanResponseCopyWith<_$_SuratJalanResponse> get copyWith =>
      __$$_SuratJalanResponseCopyWithImpl<_$_SuratJalanResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SuratJalanResponseToJson(
      this,
    );
  }
}

abstract class _SuratJalanResponse implements SuratJalanResponse {
  const factory _SuratJalanResponse(
      {final bool? success,
      final String? message,
      final SuratJalanRespData? data}) = _$_SuratJalanResponse;

  factory _SuratJalanResponse.fromJson(Map<String, dynamic> json) =
      _$_SuratJalanResponse.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  SuratJalanRespData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_SuratJalanResponseCopyWith<_$_SuratJalanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
