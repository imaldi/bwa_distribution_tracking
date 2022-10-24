// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'send_scan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendScanResponse _$SendScanResponseFromJson(Map<String, dynamic> json) {
  return _SendScanResponse.fromJson(json);
}

/// @nodoc
mixin _$SendScanResponse {
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendScanResponseCopyWith<SendScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendScanResponseCopyWith<$Res> {
  factory $SendScanResponseCopyWith(
          SendScanResponse value, $Res Function(SendScanResponse) then) =
      _$SendScanResponseCopyWithImpl<$Res, SendScanResponse>;
  @useResult
  $Res call({bool? success});
}

/// @nodoc
class _$SendScanResponseCopyWithImpl<$Res, $Val extends SendScanResponse>
    implements $SendScanResponseCopyWith<$Res> {
  _$SendScanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendScanResponseCopyWith<$Res>
    implements $SendScanResponseCopyWith<$Res> {
  factory _$$_SendScanResponseCopyWith(
          _$_SendScanResponse value, $Res Function(_$_SendScanResponse) then) =
      __$$_SendScanResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success});
}

/// @nodoc
class __$$_SendScanResponseCopyWithImpl<$Res>
    extends _$SendScanResponseCopyWithImpl<$Res, _$_SendScanResponse>
    implements _$$_SendScanResponseCopyWith<$Res> {
  __$$_SendScanResponseCopyWithImpl(
      _$_SendScanResponse _value, $Res Function(_$_SendScanResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$_SendScanResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendScanResponse implements _SendScanResponse {
  const _$_SendScanResponse({this.success});

  factory _$_SendScanResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SendScanResponseFromJson(json);

  @override
  final bool? success;

  @override
  String toString() {
    return 'SendScanResponse(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendScanResponse &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendScanResponseCopyWith<_$_SendScanResponse> get copyWith =>
      __$$_SendScanResponseCopyWithImpl<_$_SendScanResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendScanResponseToJson(
      this,
    );
  }
}

abstract class _SendScanResponse implements SendScanResponse {
  const factory _SendScanResponse({final bool? success}) = _$_SendScanResponse;

  factory _SendScanResponse.fromJson(Map<String, dynamic> json) =
      _$_SendScanResponse.fromJson;

  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$_SendScanResponseCopyWith<_$_SendScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
