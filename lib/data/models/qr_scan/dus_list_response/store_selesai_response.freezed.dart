// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_selesai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreSelesaiResponse _$StoreSelesaiResponseFromJson(Map<String, dynamic> json) {
  return _StoreSelesaiResponse.fromJson(json);
}

/// @nodoc
mixin _$StoreSelesaiResponse {
  bool? get success => throw _privateConstructorUsedError;
  StoreSelesaiHeader? get header => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreSelesaiResponseCopyWith<StoreSelesaiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreSelesaiResponseCopyWith<$Res> {
  factory $StoreSelesaiResponseCopyWith(StoreSelesaiResponse value,
          $Res Function(StoreSelesaiResponse) then) =
      _$StoreSelesaiResponseCopyWithImpl<$Res, StoreSelesaiResponse>;
  @useResult
  $Res call({bool? success, StoreSelesaiHeader? header});

  $StoreSelesaiHeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$StoreSelesaiResponseCopyWithImpl<$Res,
        $Val extends StoreSelesaiResponse>
    implements $StoreSelesaiResponseCopyWith<$Res> {
  _$StoreSelesaiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? header = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as StoreSelesaiHeader?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreSelesaiHeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $StoreSelesaiHeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoreSelesaiResponseCopyWith<$Res>
    implements $StoreSelesaiResponseCopyWith<$Res> {
  factory _$$_StoreSelesaiResponseCopyWith(_$_StoreSelesaiResponse value,
          $Res Function(_$_StoreSelesaiResponse) then) =
      __$$_StoreSelesaiResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, StoreSelesaiHeader? header});

  @override
  $StoreSelesaiHeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$_StoreSelesaiResponseCopyWithImpl<$Res>
    extends _$StoreSelesaiResponseCopyWithImpl<$Res, _$_StoreSelesaiResponse>
    implements _$$_StoreSelesaiResponseCopyWith<$Res> {
  __$$_StoreSelesaiResponseCopyWithImpl(_$_StoreSelesaiResponse _value,
      $Res Function(_$_StoreSelesaiResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? header = freezed,
  }) {
    return _then(_$_StoreSelesaiResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as StoreSelesaiHeader?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreSelesaiResponse implements _StoreSelesaiResponse {
  const _$_StoreSelesaiResponse(
      {this.success, this.header = const StoreSelesaiHeader()});

  factory _$_StoreSelesaiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StoreSelesaiResponseFromJson(json);

  @override
  final bool? success;
  @override
  @JsonKey()
  final StoreSelesaiHeader? header;

  @override
  String toString() {
    return 'StoreSelesaiResponse(success: $success, header: $header)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreSelesaiResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.header, header) || other.header == header));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, header);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreSelesaiResponseCopyWith<_$_StoreSelesaiResponse> get copyWith =>
      __$$_StoreSelesaiResponseCopyWithImpl<_$_StoreSelesaiResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreSelesaiResponseToJson(
      this,
    );
  }
}

abstract class _StoreSelesaiResponse implements StoreSelesaiResponse {
  const factory _StoreSelesaiResponse(
      {final bool? success,
      final StoreSelesaiHeader? header}) = _$_StoreSelesaiResponse;

  factory _StoreSelesaiResponse.fromJson(Map<String, dynamic> json) =
      _$_StoreSelesaiResponse.fromJson;

  @override
  bool? get success;
  @override
  StoreSelesaiHeader? get header;
  @override
  @JsonKey(ignore: true)
  _$$_StoreSelesaiResponseCopyWith<_$_StoreSelesaiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
