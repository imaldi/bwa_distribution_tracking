// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dus_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DusDetailResponse _$DusDetailResponseFromJson(Map<String, dynamic> json) {
  return _DusDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$DusDetailResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<Dushead>? get dushead => throw _privateConstructorUsedError;
  List<Dusdetail>? get dusdetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusDetailResponseCopyWith<DusDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusDetailResponseCopyWith<$Res> {
  factory $DusDetailResponseCopyWith(
          DusDetailResponse value, $Res Function(DusDetailResponse) then) =
      _$DusDetailResponseCopyWithImpl<$Res, DusDetailResponse>;
  @useResult
  $Res call(
      {bool? success,
      String? message,
      List<Dushead>? dushead,
      List<Dusdetail>? dusdetail});
}

/// @nodoc
class _$DusDetailResponseCopyWithImpl<$Res, $Val extends DusDetailResponse>
    implements $DusDetailResponseCopyWith<$Res> {
  _$DusDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? dushead = freezed,
    Object? dusdetail = freezed,
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
      dushead: freezed == dushead
          ? _value.dushead
          : dushead // ignore: cast_nullable_to_non_nullable
              as List<Dushead>?,
      dusdetail: freezed == dusdetail
          ? _value.dusdetail
          : dusdetail // ignore: cast_nullable_to_non_nullable
              as List<Dusdetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DusDetailResponseCopyWith<$Res>
    implements $DusDetailResponseCopyWith<$Res> {
  factory _$$_DusDetailResponseCopyWith(_$_DusDetailResponse value,
          $Res Function(_$_DusDetailResponse) then) =
      __$$_DusDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? message,
      List<Dushead>? dushead,
      List<Dusdetail>? dusdetail});
}

/// @nodoc
class __$$_DusDetailResponseCopyWithImpl<$Res>
    extends _$DusDetailResponseCopyWithImpl<$Res, _$_DusDetailResponse>
    implements _$$_DusDetailResponseCopyWith<$Res> {
  __$$_DusDetailResponseCopyWithImpl(
      _$_DusDetailResponse _value, $Res Function(_$_DusDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? dushead = freezed,
    Object? dusdetail = freezed,
  }) {
    return _then(_$_DusDetailResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      dushead: freezed == dushead
          ? _value._dushead
          : dushead // ignore: cast_nullable_to_non_nullable
              as List<Dushead>?,
      dusdetail: freezed == dusdetail
          ? _value._dusdetail
          : dusdetail // ignore: cast_nullable_to_non_nullable
              as List<Dusdetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DusDetailResponse implements _DusDetailResponse {
  const _$_DusDetailResponse(
      {this.success,
      this.message,
      final List<Dushead>? dushead,
      final List<Dusdetail>? dusdetail})
      : _dushead = dushead,
        _dusdetail = dusdetail;

  factory _$_DusDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DusDetailResponseFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<Dushead>? _dushead;
  @override
  List<Dushead>? get dushead {
    final value = _dushead;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Dusdetail>? _dusdetail;
  @override
  List<Dusdetail>? get dusdetail {
    final value = _dusdetail;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DusDetailResponse(success: $success, message: $message, dushead: $dushead, dusdetail: $dusdetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DusDetailResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._dushead, _dushead) &&
            const DeepCollectionEquality()
                .equals(other._dusdetail, _dusdetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      const DeepCollectionEquality().hash(_dushead),
      const DeepCollectionEquality().hash(_dusdetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusDetailResponseCopyWith<_$_DusDetailResponse> get copyWith =>
      __$$_DusDetailResponseCopyWithImpl<_$_DusDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusDetailResponseToJson(
      this,
    );
  }
}

abstract class _DusDetailResponse implements DusDetailResponse {
  const factory _DusDetailResponse(
      {final bool? success,
      final String? message,
      final List<Dushead>? dushead,
      final List<Dusdetail>? dusdetail}) = _$_DusDetailResponse;

  factory _DusDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_DusDetailResponse.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<Dushead>? get dushead;
  @override
  List<Dusdetail>? get dusdetail;
  @override
  @JsonKey(ignore: true)
  _$$_DusDetailResponseCopyWith<_$_DusDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Dusdetail _$DusdetailFromJson(Map<String, dynamic> json) {
  return _Dusdetail.fromJson(json);
}

/// @nodoc
mixin _$Dusdetail {
  int? get id => throw _privateConstructorUsedError;
  String? get nosj => throw _privateConstructorUsedError;
  @JsonKey(name: "qrcode_sj")
  String? get qrcodeSj => throw _privateConstructorUsedError;
  String? get nodus => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  @JsonKey(name: "id_location")
  String? get idLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_by")
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusdetailCopyWith<Dusdetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusdetailCopyWith<$Res> {
  factory $DusdetailCopyWith(Dusdetail value, $Res Function(Dusdetail) then) =
      _$DusdetailCopyWithImpl<$Res, Dusdetail>;
  @useResult
  $Res call(
      {int? id,
      String? nosj,
      @JsonKey(name: "qrcode_sj") String? qrcodeSj,
      String? nodus,
      String? foto,
      @JsonKey(name: "id_location") String? idLocation,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$DusdetailCopyWithImpl<$Res, $Val extends Dusdetail>
    implements $DusdetailCopyWith<$Res> {
  _$DusdetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nosj = freezed,
    Object? qrcodeSj = freezed,
    Object? nodus = freezed,
    Object? foto = freezed,
    Object? idLocation = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nosj: freezed == nosj
          ? _value.nosj
          : nosj // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcodeSj: freezed == qrcodeSj
          ? _value.qrcodeSj
          : qrcodeSj // ignore: cast_nullable_to_non_nullable
              as String?,
      nodus: freezed == nodus
          ? _value.nodus
          : nodus // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      idLocation: freezed == idLocation
          ? _value.idLocation
          : idLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DusdetailCopyWith<$Res> implements $DusdetailCopyWith<$Res> {
  factory _$$_DusdetailCopyWith(
          _$_Dusdetail value, $Res Function(_$_Dusdetail) then) =
      __$$_DusdetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? nosj,
      @JsonKey(name: "qrcode_sj") String? qrcodeSj,
      String? nodus,
      String? foto,
      @JsonKey(name: "id_location") String? idLocation,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$_DusdetailCopyWithImpl<$Res>
    extends _$DusdetailCopyWithImpl<$Res, _$_Dusdetail>
    implements _$$_DusdetailCopyWith<$Res> {
  __$$_DusdetailCopyWithImpl(
      _$_Dusdetail _value, $Res Function(_$_Dusdetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nosj = freezed,
    Object? qrcodeSj = freezed,
    Object? nodus = freezed,
    Object? foto = freezed,
    Object? idLocation = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Dusdetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nosj: freezed == nosj
          ? _value.nosj
          : nosj // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcodeSj: freezed == qrcodeSj
          ? _value.qrcodeSj
          : qrcodeSj // ignore: cast_nullable_to_non_nullable
              as String?,
      nodus: freezed == nodus
          ? _value.nodus
          : nodus // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      idLocation: freezed == idLocation
          ? _value.idLocation
          : idLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dusdetail implements _Dusdetail {
  const _$_Dusdetail(
      {this.id,
      this.nosj,
      @JsonKey(name: "qrcode_sj") this.qrcodeSj,
      this.nodus,
      this.foto,
      @JsonKey(name: "id_location") this.idLocation,
      @JsonKey(name: "createdBy") this.createdBy,
      @JsonKey(name: "updated_by") this.updatedBy,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$_Dusdetail.fromJson(Map<String, dynamic> json) =>
      _$$_DusdetailFromJson(json);

  @override
  final int? id;
  @override
  final String? nosj;
  @override
  @JsonKey(name: "qrcode_sj")
  final String? qrcodeSj;
  @override
  final String? nodus;
  @override
  final String? foto;
  @override
  @JsonKey(name: "id_location")
  final String? idLocation;
  @override
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @override
  @JsonKey(name: "updated_by")
  final String? updatedBy;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Dusdetail(id: $id, nosj: $nosj, qrcodeSj: $qrcodeSj, nodus: $nodus, foto: $foto, idLocation: $idLocation, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dusdetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nosj, nosj) || other.nosj == nosj) &&
            (identical(other.qrcodeSj, qrcodeSj) ||
                other.qrcodeSj == qrcodeSj) &&
            (identical(other.nodus, nodus) || other.nodus == nodus) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.idLocation, idLocation) ||
                other.idLocation == idLocation) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nosj, qrcodeSj, nodus, foto,
      idLocation, createdBy, updatedBy, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusdetailCopyWith<_$_Dusdetail> get copyWith =>
      __$$_DusdetailCopyWithImpl<_$_Dusdetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusdetailToJson(
      this,
    );
  }
}

abstract class _Dusdetail implements Dusdetail {
  const factory _Dusdetail(
      {final int? id,
      final String? nosj,
      @JsonKey(name: "qrcode_sj") final String? qrcodeSj,
      final String? nodus,
      final String? foto,
      @JsonKey(name: "id_location") final String? idLocation,
      @JsonKey(name: "createdBy") final String? createdBy,
      @JsonKey(name: "updated_by") final String? updatedBy,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$_Dusdetail;

  factory _Dusdetail.fromJson(Map<String, dynamic> json) =
      _$_Dusdetail.fromJson;

  @override
  int? get id;
  @override
  String? get nosj;
  @override
  @JsonKey(name: "qrcode_sj")
  String? get qrcodeSj;
  @override
  String? get nodus;
  @override
  String? get foto;
  @override
  @JsonKey(name: "id_location")
  String? get idLocation;
  @override
  @JsonKey(name: "createdBy")
  String? get createdBy;
  @override
  @JsonKey(name: "updated_by")
  String? get updatedBy;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DusdetailCopyWith<_$_Dusdetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Dushead _$DusheadFromJson(Map<String, dynamic> json) {
  return _Dushead.fromJson(json);
}

/// @nodoc
mixin _$Dushead {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "location_id")
  String? get locationId => throw _privateConstructorUsedError;
  String? get nosj => throw _privateConstructorUsedError;
  @JsonKey(name: "qrcode_sj")
  String? get qrcodeSj => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longtitude => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_penerima")
  String? get namaPenerima => throw _privateConstructorUsedError;
  @JsonKey(name: "no_hp")
  String? get noHp => throw _privateConstructorUsedError;
  String? get lembaga => throw _privateConstructorUsedError;
  String? get nmTempat => throw _privateConstructorUsedError;
  @JsonKey(name: "detail_tempat")
  String? get detailTempat => throw _privateConstructorUsedError;
  String? get kelurahan => throw _privateConstructorUsedError;
  String? get kecamatan => throw _privateConstructorUsedError;
  String? get kabupaten => throw _privateConstructorUsedError;
  String? get provinsi => throw _privateConstructorUsedError;
  @JsonKey(name: "status_pengiriman")
  String? get statusPengiriman => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_by")
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusheadCopyWith<Dushead> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusheadCopyWith<$Res> {
  factory $DusheadCopyWith(Dushead value, $Res Function(Dushead) then) =
      _$DusheadCopyWithImpl<$Res, Dushead>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "location_id") String? locationId,
      String? nosj,
      @JsonKey(name: "qrcode_sj") String? qrcodeSj,
      String? latitude,
      String? longtitude,
      @JsonKey(name: "nama_penerima") String? namaPenerima,
      @JsonKey(name: "no_hp") String? noHp,
      String? lembaga,
      String? nmTempat,
      @JsonKey(name: "detail_tempat") String? detailTempat,
      String? kelurahan,
      String? kecamatan,
      String? kabupaten,
      String? provinsi,
      @JsonKey(name: "status_pengiriman") String? statusPengiriman,
      String? foto,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$DusheadCopyWithImpl<$Res, $Val extends Dushead>
    implements $DusheadCopyWith<$Res> {
  _$DusheadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? locationId = freezed,
    Object? nosj = freezed,
    Object? qrcodeSj = freezed,
    Object? latitude = freezed,
    Object? longtitude = freezed,
    Object? namaPenerima = freezed,
    Object? noHp = freezed,
    Object? lembaga = freezed,
    Object? nmTempat = freezed,
    Object? detailTempat = freezed,
    Object? kelurahan = freezed,
    Object? kecamatan = freezed,
    Object? kabupaten = freezed,
    Object? provinsi = freezed,
    Object? statusPengiriman = freezed,
    Object? foto = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      nosj: freezed == nosj
          ? _value.nosj
          : nosj // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcodeSj: freezed == qrcodeSj
          ? _value.qrcodeSj
          : qrcodeSj // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longtitude: freezed == longtitude
          ? _value.longtitude
          : longtitude // ignore: cast_nullable_to_non_nullable
              as String?,
      namaPenerima: freezed == namaPenerima
          ? _value.namaPenerima
          : namaPenerima // ignore: cast_nullable_to_non_nullable
              as String?,
      noHp: freezed == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String?,
      lembaga: freezed == lembaga
          ? _value.lembaga
          : lembaga // ignore: cast_nullable_to_non_nullable
              as String?,
      nmTempat: freezed == nmTempat
          ? _value.nmTempat
          : nmTempat // ignore: cast_nullable_to_non_nullable
              as String?,
      detailTempat: freezed == detailTempat
          ? _value.detailTempat
          : detailTempat // ignore: cast_nullable_to_non_nullable
              as String?,
      kelurahan: freezed == kelurahan
          ? _value.kelurahan
          : kelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      kecamatan: freezed == kecamatan
          ? _value.kecamatan
          : kecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      kabupaten: freezed == kabupaten
          ? _value.kabupaten
          : kabupaten // ignore: cast_nullable_to_non_nullable
              as String?,
      provinsi: freezed == provinsi
          ? _value.provinsi
          : provinsi // ignore: cast_nullable_to_non_nullable
              as String?,
      statusPengiriman: freezed == statusPengiriman
          ? _value.statusPengiriman
          : statusPengiriman // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DusheadCopyWith<$Res> implements $DusheadCopyWith<$Res> {
  factory _$$_DusheadCopyWith(
          _$_Dushead value, $Res Function(_$_Dushead) then) =
      __$$_DusheadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "location_id") String? locationId,
      String? nosj,
      @JsonKey(name: "qrcode_sj") String? qrcodeSj,
      String? latitude,
      String? longtitude,
      @JsonKey(name: "nama_penerima") String? namaPenerima,
      @JsonKey(name: "no_hp") String? noHp,
      String? lembaga,
      String? nmTempat,
      @JsonKey(name: "detail_tempat") String? detailTempat,
      String? kelurahan,
      String? kecamatan,
      String? kabupaten,
      String? provinsi,
      @JsonKey(name: "status_pengiriman") String? statusPengiriman,
      String? foto,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$_DusheadCopyWithImpl<$Res>
    extends _$DusheadCopyWithImpl<$Res, _$_Dushead>
    implements _$$_DusheadCopyWith<$Res> {
  __$$_DusheadCopyWithImpl(_$_Dushead _value, $Res Function(_$_Dushead) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? locationId = freezed,
    Object? nosj = freezed,
    Object? qrcodeSj = freezed,
    Object? latitude = freezed,
    Object? longtitude = freezed,
    Object? namaPenerima = freezed,
    Object? noHp = freezed,
    Object? lembaga = freezed,
    Object? nmTempat = freezed,
    Object? detailTempat = freezed,
    Object? kelurahan = freezed,
    Object? kecamatan = freezed,
    Object? kabupaten = freezed,
    Object? provinsi = freezed,
    Object? statusPengiriman = freezed,
    Object? foto = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Dushead(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      nosj: freezed == nosj
          ? _value.nosj
          : nosj // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcodeSj: freezed == qrcodeSj
          ? _value.qrcodeSj
          : qrcodeSj // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longtitude: freezed == longtitude
          ? _value.longtitude
          : longtitude // ignore: cast_nullable_to_non_nullable
              as String?,
      namaPenerima: freezed == namaPenerima
          ? _value.namaPenerima
          : namaPenerima // ignore: cast_nullable_to_non_nullable
              as String?,
      noHp: freezed == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String?,
      lembaga: freezed == lembaga
          ? _value.lembaga
          : lembaga // ignore: cast_nullable_to_non_nullable
              as String?,
      nmTempat: freezed == nmTempat
          ? _value.nmTempat
          : nmTempat // ignore: cast_nullable_to_non_nullable
              as String?,
      detailTempat: freezed == detailTempat
          ? _value.detailTempat
          : detailTempat // ignore: cast_nullable_to_non_nullable
              as String?,
      kelurahan: freezed == kelurahan
          ? _value.kelurahan
          : kelurahan // ignore: cast_nullable_to_non_nullable
              as String?,
      kecamatan: freezed == kecamatan
          ? _value.kecamatan
          : kecamatan // ignore: cast_nullable_to_non_nullable
              as String?,
      kabupaten: freezed == kabupaten
          ? _value.kabupaten
          : kabupaten // ignore: cast_nullable_to_non_nullable
              as String?,
      provinsi: freezed == provinsi
          ? _value.provinsi
          : provinsi // ignore: cast_nullable_to_non_nullable
              as String?,
      statusPengiriman: freezed == statusPengiriman
          ? _value.statusPengiriman
          : statusPengiriman // ignore: cast_nullable_to_non_nullable
              as String?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dushead implements _Dushead {
  const _$_Dushead(
      {this.id,
      @JsonKey(name: "location_id") this.locationId,
      this.nosj,
      @JsonKey(name: "qrcode_sj") this.qrcodeSj,
      this.latitude,
      this.longtitude,
      @JsonKey(name: "nama_penerima") this.namaPenerima,
      @JsonKey(name: "no_hp") this.noHp,
      this.lembaga,
      this.nmTempat,
      @JsonKey(name: "detail_tempat") this.detailTempat,
      this.kelurahan,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      @JsonKey(name: "status_pengiriman") this.statusPengiriman,
      this.foto,
      @JsonKey(name: "createdBy") this.createdBy,
      @JsonKey(name: "updated_by") this.updatedBy,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$_Dushead.fromJson(Map<String, dynamic> json) =>
      _$$_DusheadFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "location_id")
  final String? locationId;
  @override
  final String? nosj;
  @override
  @JsonKey(name: "qrcode_sj")
  final String? qrcodeSj;
  @override
  final String? latitude;
  @override
  final String? longtitude;
  @override
  @JsonKey(name: "nama_penerima")
  final String? namaPenerima;
  @override
  @JsonKey(name: "no_hp")
  final String? noHp;
  @override
  final String? lembaga;
  @override
  final String? nmTempat;
  @override
  @JsonKey(name: "detail_tempat")
  final String? detailTempat;
  @override
  final String? kelurahan;
  @override
  final String? kecamatan;
  @override
  final String? kabupaten;
  @override
  final String? provinsi;
  @override
  @JsonKey(name: "status_pengiriman")
  final String? statusPengiriman;
  @override
  final String? foto;
  @override
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @override
  @JsonKey(name: "updated_by")
  final String? updatedBy;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Dushead(id: $id, locationId: $locationId, nosj: $nosj, qrcodeSj: $qrcodeSj, latitude: $latitude, longtitude: $longtitude, namaPenerima: $namaPenerima, noHp: $noHp, lembaga: $lembaga, nmTempat: $nmTempat, detailTempat: $detailTempat, kelurahan: $kelurahan, kecamatan: $kecamatan, kabupaten: $kabupaten, provinsi: $provinsi, statusPengiriman: $statusPengiriman, foto: $foto, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dushead &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.nosj, nosj) || other.nosj == nosj) &&
            (identical(other.qrcodeSj, qrcodeSj) ||
                other.qrcodeSj == qrcodeSj) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longtitude, longtitude) ||
                other.longtitude == longtitude) &&
            (identical(other.namaPenerima, namaPenerima) ||
                other.namaPenerima == namaPenerima) &&
            (identical(other.noHp, noHp) || other.noHp == noHp) &&
            (identical(other.lembaga, lembaga) || other.lembaga == lembaga) &&
            (identical(other.nmTempat, nmTempat) ||
                other.nmTempat == nmTempat) &&
            (identical(other.detailTempat, detailTempat) ||
                other.detailTempat == detailTempat) &&
            (identical(other.kelurahan, kelurahan) ||
                other.kelurahan == kelurahan) &&
            (identical(other.kecamatan, kecamatan) ||
                other.kecamatan == kecamatan) &&
            (identical(other.kabupaten, kabupaten) ||
                other.kabupaten == kabupaten) &&
            (identical(other.provinsi, provinsi) ||
                other.provinsi == provinsi) &&
            (identical(other.statusPengiriman, statusPengiriman) ||
                other.statusPengiriman == statusPengiriman) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        locationId,
        nosj,
        qrcodeSj,
        latitude,
        longtitude,
        namaPenerima,
        noHp,
        lembaga,
        nmTempat,
        detailTempat,
        kelurahan,
        kecamatan,
        kabupaten,
        provinsi,
        statusPengiriman,
        foto,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusheadCopyWith<_$_Dushead> get copyWith =>
      __$$_DusheadCopyWithImpl<_$_Dushead>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusheadToJson(
      this,
    );
  }
}

abstract class _Dushead implements Dushead {
  const factory _Dushead(
      {final int? id,
      @JsonKey(name: "location_id") final String? locationId,
      final String? nosj,
      @JsonKey(name: "qrcode_sj") final String? qrcodeSj,
      final String? latitude,
      final String? longtitude,
      @JsonKey(name: "nama_penerima") final String? namaPenerima,
      @JsonKey(name: "no_hp") final String? noHp,
      final String? lembaga,
      final String? nmTempat,
      @JsonKey(name: "detail_tempat") final String? detailTempat,
      final String? kelurahan,
      final String? kecamatan,
      final String? kabupaten,
      final String? provinsi,
      @JsonKey(name: "status_pengiriman") final String? statusPengiriman,
      final String? foto,
      @JsonKey(name: "createdBy") final String? createdBy,
      @JsonKey(name: "updated_by") final String? updatedBy,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt}) = _$_Dushead;

  factory _Dushead.fromJson(Map<String, dynamic> json) = _$_Dushead.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "location_id")
  String? get locationId;
  @override
  String? get nosj;
  @override
  @JsonKey(name: "qrcode_sj")
  String? get qrcodeSj;
  @override
  String? get latitude;
  @override
  String? get longtitude;
  @override
  @JsonKey(name: "nama_penerima")
  String? get namaPenerima;
  @override
  @JsonKey(name: "no_hp")
  String? get noHp;
  @override
  String? get lembaga;
  @override
  String? get nmTempat;
  @override
  @JsonKey(name: "detail_tempat")
  String? get detailTempat;
  @override
  String? get kelurahan;
  @override
  String? get kecamatan;
  @override
  String? get kabupaten;
  @override
  String? get provinsi;
  @override
  @JsonKey(name: "status_pengiriman")
  String? get statusPengiriman;
  @override
  String? get foto;
  @override
  @JsonKey(name: "createdBy")
  String? get createdBy;
  @override
  @JsonKey(name: "updated_by")
  String? get updatedBy;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DusheadCopyWith<_$_Dushead> get copyWith =>
      throw _privateConstructorUsedError;
}
