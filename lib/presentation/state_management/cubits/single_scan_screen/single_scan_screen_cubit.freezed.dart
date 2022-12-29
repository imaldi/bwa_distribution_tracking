// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'single_scan_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleScanScreenCubitState _$SingleScanScreenCubitStateFromJson(
    Map<String, dynamic> json) {
  return _SingleScanScreenState.fromJson(json);
}

/// @nodoc
mixin _$SingleScanScreenCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  DusListResponse? get dusListResponse => throw _privateConstructorUsedError;
  DusScanResponse? get dusScanResponse => throw _privateConstructorUsedError;
  int get currentDusNumber => throw _privateConstructorUsedError;
  Map<String, String>? get qrCodeAndPhotoPathMap =>
      throw _privateConstructorUsedError;
  StoreSelesaiResponse? get storeSelesaiResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleScanScreenCubitStateCopyWith<SingleScanScreenCubitState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleScanScreenCubitStateCopyWith<$Res> {
  factory $SingleScanScreenCubitStateCopyWith(SingleScanScreenCubitState value,
          $Res Function(SingleScanScreenCubitState) then) =
      _$SingleScanScreenCubitStateCopyWithImpl<$Res,
          SingleScanScreenCubitState>;
  @useResult
  $Res call(
      {bool isLoading,
      DusListResponse? dusListResponse,
      DusScanResponse? dusScanResponse,
      int currentDusNumber,
      Map<String, String>? qrCodeAndPhotoPathMap,
      StoreSelesaiResponse? storeSelesaiResponse});

  $DusListResponseCopyWith<$Res>? get dusListResponse;
  $DusScanResponseCopyWith<$Res>? get dusScanResponse;
  $StoreSelesaiResponseCopyWith<$Res>? get storeSelesaiResponse;
}

/// @nodoc
class _$SingleScanScreenCubitStateCopyWithImpl<$Res,
        $Val extends SingleScanScreenCubitState>
    implements $SingleScanScreenCubitStateCopyWith<$Res> {
  _$SingleScanScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dusListResponse = freezed,
    Object? dusScanResponse = freezed,
    Object? currentDusNumber = null,
    Object? qrCodeAndPhotoPathMap = freezed,
    Object? storeSelesaiResponse = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dusListResponse: freezed == dusListResponse
          ? _value.dusListResponse
          : dusListResponse // ignore: cast_nullable_to_non_nullable
              as DusListResponse?,
      dusScanResponse: freezed == dusScanResponse
          ? _value.dusScanResponse
          : dusScanResponse // ignore: cast_nullable_to_non_nullable
              as DusScanResponse?,
      currentDusNumber: null == currentDusNumber
          ? _value.currentDusNumber
          : currentDusNumber // ignore: cast_nullable_to_non_nullable
              as int,
      qrCodeAndPhotoPathMap: freezed == qrCodeAndPhotoPathMap
          ? _value.qrCodeAndPhotoPathMap
          : qrCodeAndPhotoPathMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      storeSelesaiResponse: freezed == storeSelesaiResponse
          ? _value.storeSelesaiResponse
          : storeSelesaiResponse // ignore: cast_nullable_to_non_nullable
              as StoreSelesaiResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DusListResponseCopyWith<$Res>? get dusListResponse {
    if (_value.dusListResponse == null) {
      return null;
    }

    return $DusListResponseCopyWith<$Res>(_value.dusListResponse!, (value) {
      return _then(_value.copyWith(dusListResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DusScanResponseCopyWith<$Res>? get dusScanResponse {
    if (_value.dusScanResponse == null) {
      return null;
    }

    return $DusScanResponseCopyWith<$Res>(_value.dusScanResponse!, (value) {
      return _then(_value.copyWith(dusScanResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreSelesaiResponseCopyWith<$Res>? get storeSelesaiResponse {
    if (_value.storeSelesaiResponse == null) {
      return null;
    }

    return $StoreSelesaiResponseCopyWith<$Res>(_value.storeSelesaiResponse!,
        (value) {
      return _then(_value.copyWith(storeSelesaiResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SingleScanScreenStateCopyWith<$Res>
    implements $SingleScanScreenCubitStateCopyWith<$Res> {
  factory _$$_SingleScanScreenStateCopyWith(_$_SingleScanScreenState value,
          $Res Function(_$_SingleScanScreenState) then) =
      __$$_SingleScanScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DusListResponse? dusListResponse,
      DusScanResponse? dusScanResponse,
      int currentDusNumber,
      Map<String, String>? qrCodeAndPhotoPathMap,
      StoreSelesaiResponse? storeSelesaiResponse});

  @override
  $DusListResponseCopyWith<$Res>? get dusListResponse;
  @override
  $DusScanResponseCopyWith<$Res>? get dusScanResponse;
  @override
  $StoreSelesaiResponseCopyWith<$Res>? get storeSelesaiResponse;
}

/// @nodoc
class __$$_SingleScanScreenStateCopyWithImpl<$Res>
    extends _$SingleScanScreenCubitStateCopyWithImpl<$Res,
        _$_SingleScanScreenState>
    implements _$$_SingleScanScreenStateCopyWith<$Res> {
  __$$_SingleScanScreenStateCopyWithImpl(_$_SingleScanScreenState _value,
      $Res Function(_$_SingleScanScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dusListResponse = freezed,
    Object? dusScanResponse = freezed,
    Object? currentDusNumber = null,
    Object? qrCodeAndPhotoPathMap = freezed,
    Object? storeSelesaiResponse = freezed,
  }) {
    return _then(_$_SingleScanScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dusListResponse: freezed == dusListResponse
          ? _value.dusListResponse
          : dusListResponse // ignore: cast_nullable_to_non_nullable
              as DusListResponse?,
      dusScanResponse: freezed == dusScanResponse
          ? _value.dusScanResponse
          : dusScanResponse // ignore: cast_nullable_to_non_nullable
              as DusScanResponse?,
      currentDusNumber: null == currentDusNumber
          ? _value.currentDusNumber
          : currentDusNumber // ignore: cast_nullable_to_non_nullable
              as int,
      qrCodeAndPhotoPathMap: freezed == qrCodeAndPhotoPathMap
          ? _value._qrCodeAndPhotoPathMap
          : qrCodeAndPhotoPathMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      storeSelesaiResponse: freezed == storeSelesaiResponse
          ? _value.storeSelesaiResponse
          : storeSelesaiResponse // ignore: cast_nullable_to_non_nullable
              as StoreSelesaiResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleScanScreenState implements _SingleScanScreenState {
  const _$_SingleScanScreenState(
      {this.isLoading = false,
      this.dusListResponse,
      this.dusScanResponse,
      this.currentDusNumber = 1,
      final Map<String, String>? qrCodeAndPhotoPathMap,
      this.storeSelesaiResponse = const StoreSelesaiResponse()})
      : _qrCodeAndPhotoPathMap = qrCodeAndPhotoPathMap;

  factory _$_SingleScanScreenState.fromJson(Map<String, dynamic> json) =>
      _$$_SingleScanScreenStateFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DusListResponse? dusListResponse;
  @override
  final DusScanResponse? dusScanResponse;
  @override
  @JsonKey()
  final int currentDusNumber;
  final Map<String, String>? _qrCodeAndPhotoPathMap;
  @override
  Map<String, String>? get qrCodeAndPhotoPathMap {
    final value = _qrCodeAndPhotoPathMap;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final StoreSelesaiResponse? storeSelesaiResponse;

  @override
  String toString() {
    return 'SingleScanScreenCubitState(isLoading: $isLoading, dusListResponse: $dusListResponse, dusScanResponse: $dusScanResponse, currentDusNumber: $currentDusNumber, qrCodeAndPhotoPathMap: $qrCodeAndPhotoPathMap, storeSelesaiResponse: $storeSelesaiResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleScanScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.dusListResponse, dusListResponse) ||
                other.dusListResponse == dusListResponse) &&
            (identical(other.dusScanResponse, dusScanResponse) ||
                other.dusScanResponse == dusScanResponse) &&
            (identical(other.currentDusNumber, currentDusNumber) ||
                other.currentDusNumber == currentDusNumber) &&
            const DeepCollectionEquality()
                .equals(other._qrCodeAndPhotoPathMap, _qrCodeAndPhotoPathMap) &&
            (identical(other.storeSelesaiResponse, storeSelesaiResponse) ||
                other.storeSelesaiResponse == storeSelesaiResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      dusListResponse,
      dusScanResponse,
      currentDusNumber,
      const DeepCollectionEquality().hash(_qrCodeAndPhotoPathMap),
      storeSelesaiResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleScanScreenStateCopyWith<_$_SingleScanScreenState> get copyWith =>
      __$$_SingleScanScreenStateCopyWithImpl<_$_SingleScanScreenState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleScanScreenStateToJson(
      this,
    );
  }
}

abstract class _SingleScanScreenState implements SingleScanScreenCubitState {
  const factory _SingleScanScreenState(
          {final bool isLoading,
          final DusListResponse? dusListResponse,
          final DusScanResponse? dusScanResponse,
          final int currentDusNumber,
          final Map<String, String>? qrCodeAndPhotoPathMap,
          final StoreSelesaiResponse? storeSelesaiResponse}) =
      _$_SingleScanScreenState;

  factory _SingleScanScreenState.fromJson(Map<String, dynamic> json) =
      _$_SingleScanScreenState.fromJson;

  @override
  bool get isLoading;
  @override
  DusListResponse? get dusListResponse;
  @override
  DusScanResponse? get dusScanResponse;
  @override
  int get currentDusNumber;
  @override
  Map<String, String>? get qrCodeAndPhotoPathMap;
  @override
  StoreSelesaiResponse? get storeSelesaiResponse;
  @override
  @JsonKey(ignore: true)
  _$$_SingleScanScreenStateCopyWith<_$_SingleScanScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
