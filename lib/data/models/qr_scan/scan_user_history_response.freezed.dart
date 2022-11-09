// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scan_user_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScanUserHistoryResponse _$ScanUserHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _ScanUserHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ScanUserHistoryResponse {
  bool? get success => throw _privateConstructorUsedError;
  List<SendScanDataModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanUserHistoryResponseCopyWith<ScanUserHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanUserHistoryResponseCopyWith<$Res> {
  factory $ScanUserHistoryResponseCopyWith(ScanUserHistoryResponse value,
          $Res Function(ScanUserHistoryResponse) then) =
      _$ScanUserHistoryResponseCopyWithImpl<$Res, ScanUserHistoryResponse>;
  @useResult
  $Res call({bool? success, List<SendScanDataModel>? data});
}

/// @nodoc
class _$ScanUserHistoryResponseCopyWithImpl<$Res,
        $Val extends ScanUserHistoryResponse>
    implements $ScanUserHistoryResponseCopyWith<$Res> {
  _$ScanUserHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SendScanDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanUserHistoryResponseCopyWith<$Res>
    implements $ScanUserHistoryResponseCopyWith<$Res> {
  factory _$$_ScanUserHistoryResponseCopyWith(_$_ScanUserHistoryResponse value,
          $Res Function(_$_ScanUserHistoryResponse) then) =
      __$$_ScanUserHistoryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, List<SendScanDataModel>? data});
}

/// @nodoc
class __$$_ScanUserHistoryResponseCopyWithImpl<$Res>
    extends _$ScanUserHistoryResponseCopyWithImpl<$Res,
        _$_ScanUserHistoryResponse>
    implements _$$_ScanUserHistoryResponseCopyWith<$Res> {
  __$$_ScanUserHistoryResponseCopyWithImpl(_$_ScanUserHistoryResponse _value,
      $Res Function(_$_ScanUserHistoryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ScanUserHistoryResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SendScanDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScanUserHistoryResponse implements _ScanUserHistoryResponse {
  const _$_ScanUserHistoryResponse(
      {this.success, final List<SendScanDataModel>? data})
      : _data = data;

  factory _$_ScanUserHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScanUserHistoryResponseFromJson(json);

  @override
  final bool? success;
  final List<SendScanDataModel>? _data;
  @override
  List<SendScanDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScanUserHistoryResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanUserHistoryResponse &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanUserHistoryResponseCopyWith<_$_ScanUserHistoryResponse>
      get copyWith =>
          __$$_ScanUserHistoryResponseCopyWithImpl<_$_ScanUserHistoryResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScanUserHistoryResponseToJson(
      this,
    );
  }
}

abstract class _ScanUserHistoryResponse implements ScanUserHistoryResponse {
  const factory _ScanUserHistoryResponse(
      {final bool? success,
      final List<SendScanDataModel>? data}) = _$_ScanUserHistoryResponse;

  factory _ScanUserHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$_ScanUserHistoryResponse.fromJson;

  @override
  bool? get success;
  @override
  List<SendScanDataModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ScanUserHistoryResponseCopyWith<_$_ScanUserHistoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
