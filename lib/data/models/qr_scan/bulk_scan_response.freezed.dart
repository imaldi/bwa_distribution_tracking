// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bulk_scan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BulkScanResponse _$BulkScanResponseFromJson(Map<String, dynamic> json) {
  return _BulkScanResponse.fromJson(json);
}

/// @nodoc
mixin _$BulkScanResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BulkQRScanModel>? get data => throw _privateConstructorUsedError;
  List<BoxQRScanModel>? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BulkScanResponseCopyWith<BulkScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkScanResponseCopyWith<$Res> {
  factory $BulkScanResponseCopyWith(
          BulkScanResponse value, $Res Function(BulkScanResponse) then) =
      _$BulkScanResponseCopyWithImpl<$Res, BulkScanResponse>;
  @useResult
  $Res call(
      {bool? success,
      String? message,
      List<BulkQRScanModel>? data,
      List<BoxQRScanModel>? detail});
}

/// @nodoc
class _$BulkScanResponseCopyWithImpl<$Res, $Val extends BulkScanResponse>
    implements $BulkScanResponseCopyWith<$Res> {
  _$BulkScanResponseCopyWithImpl(this._value, this._then);

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
    Object? detail = freezed,
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
              as List<BulkQRScanModel>?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<BoxQRScanModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BulkScanResponseCopyWith<$Res>
    implements $BulkScanResponseCopyWith<$Res> {
  factory _$$_BulkScanResponseCopyWith(
          _$_BulkScanResponse value, $Res Function(_$_BulkScanResponse) then) =
      __$$_BulkScanResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? message,
      List<BulkQRScanModel>? data,
      List<BoxQRScanModel>? detail});
}

/// @nodoc
class __$$_BulkScanResponseCopyWithImpl<$Res>
    extends _$BulkScanResponseCopyWithImpl<$Res, _$_BulkScanResponse>
    implements _$$_BulkScanResponseCopyWith<$Res> {
  __$$_BulkScanResponseCopyWithImpl(
      _$_BulkScanResponse _value, $Res Function(_$_BulkScanResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_BulkScanResponse(
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
              as List<BulkQRScanModel>?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<BoxQRScanModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BulkScanResponse implements _BulkScanResponse {
  const _$_BulkScanResponse(
      {this.success, this.message, this.data, this.detail});

  factory _$_BulkScanResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BulkScanResponseFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final List<BulkQRScanModel>? data;
  @override
  final List<BoxQRScanModel>? detail;

  @override
  String toString() {
    return 'BulkScanResponse(success: $success, message: $message, data: $data, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BulkScanResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.detail, detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BulkScanResponseCopyWith<_$_BulkScanResponse> get copyWith =>
      __$$_BulkScanResponseCopyWithImpl<_$_BulkScanResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BulkScanResponseToJson(
      this,
    );
  }
}

abstract class _BulkScanResponse implements BulkScanResponse {
  const factory _BulkScanResponse(
      {final bool? success,
      final String? message,
      final List<BulkQRScanModel>? data,
      final List<BoxQRScanModel>? detail}) = _$_BulkScanResponse;

  factory _BulkScanResponse.fromJson(Map<String, dynamic> json) =
      _$_BulkScanResponse.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<BulkQRScanModel>? get data;
  @override
  List<BoxQRScanModel>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_BulkScanResponseCopyWith<_$_BulkScanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
