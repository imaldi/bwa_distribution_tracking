// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dus_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DusListResponse _$DusListResponseFromJson(Map<String, dynamic> json) {
  return _DusListResponse.fromJson(json);
}

/// @nodoc
mixin _$DusListResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<DusData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusListResponseCopyWith<DusListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusListResponseCopyWith<$Res> {
  factory $DusListResponseCopyWith(
          DusListResponse value, $Res Function(DusListResponse) then) =
      _$DusListResponseCopyWithImpl<$Res, DusListResponse>;
  @useResult
  $Res call({bool? success, String? message, List<DusData>? data});
}

/// @nodoc
class _$DusListResponseCopyWithImpl<$Res, $Val extends DusListResponse>
    implements $DusListResponseCopyWith<$Res> {
  _$DusListResponseCopyWithImpl(this._value, this._then);

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
              as List<DusData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DusListResponseCopyWith<$Res>
    implements $DusListResponseCopyWith<$Res> {
  factory _$$_DusListResponseCopyWith(
          _$_DusListResponse value, $Res Function(_$_DusListResponse) then) =
      __$$_DusListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<DusData>? data});
}

/// @nodoc
class __$$_DusListResponseCopyWithImpl<$Res>
    extends _$DusListResponseCopyWithImpl<$Res, _$_DusListResponse>
    implements _$$_DusListResponseCopyWith<$Res> {
  __$$_DusListResponseCopyWithImpl(
      _$_DusListResponse _value, $Res Function(_$_DusListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DusListResponse(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DusData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DusListResponse implements _DusListResponse {
  const _$_DusListResponse(
      {this.success, this.message, final List<DusData>? data})
      : _data = data;

  factory _$_DusListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DusListResponseFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<DusData>? _data;
  @override
  List<DusData>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DusListResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DusListResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusListResponseCopyWith<_$_DusListResponse> get copyWith =>
      __$$_DusListResponseCopyWithImpl<_$_DusListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusListResponseToJson(
      this,
    );
  }
}

abstract class _DusListResponse implements DusListResponse {
  const factory _DusListResponse(
      {final bool? success,
      final String? message,
      final List<DusData>? data}) = _$_DusListResponse;

  factory _DusListResponse.fromJson(Map<String, dynamic> json) =
      _$_DusListResponse.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<DusData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DusListResponseCopyWith<_$_DusListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DusData _$DusDataFromJson(Map<String, dynamic> json) {
  return _DusData.fromJson(json);
}

/// @nodoc
mixin _$DusData {
  String? get id => throw _privateConstructorUsedError;
  String? get nosj => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrcode_sj')
  String? get qrcodeSj => throw _privateConstructorUsedError;
  String? get nodus => throw _privateConstructorUsedError;
  Object? get foto => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_location')
  String? get idLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  String? get locationId => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_penerima')
  String? get namaPenerima => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_hp')
  String? get noHp => throw _privateConstructorUsedError;
  String? get lembaga => throw _privateConstructorUsedError;
  @JsonKey(name: 'nm_tempat')
  String? get nmTempat => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail_tempat')
  String? get detailTempat => throw _privateConstructorUsedError;
  String? get kelurahan => throw _privateConstructorUsedError;
  String? get kecamatan => throw _privateConstructorUsedError;
  String? get kabupaten => throw _privateConstructorUsedError;
  String? get provinsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_pengiriman')
  String? get statusPengiriman => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DusDataCopyWith<DusData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DusDataCopyWith<$Res> {
  factory $DusDataCopyWith(DusData value, $Res Function(DusData) then) =
      _$DusDataCopyWithImpl<$Res, DusData>;
  @useResult
  $Res call(
      {String? id,
      String? nosj,
      @JsonKey(name: 'qrcode_sj') String? qrcodeSj,
      String? nodus,
      Object? foto,
      @JsonKey(name: 'id_location') String? idLocation,
      @JsonKey(name: 'location_id') String? locationId,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'nama_penerima') String? namaPenerima,
      @JsonKey(name: 'no_hp') String? noHp,
      String? lembaga,
      @JsonKey(name: 'nm_tempat') String? nmTempat,
      @JsonKey(name: 'detail_tempat') String? detailTempat,
      String? kelurahan,
      String? kecamatan,
      String? kabupaten,
      String? provinsi,
      @JsonKey(name: 'status_pengiriman') String? statusPengiriman,
      @JsonKey(name: 'created_by') String? createdBy,
      @JsonKey(name: 'updated_by') String? updatedBy,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$DusDataCopyWithImpl<$Res, $Val extends DusData>
    implements $DusDataCopyWith<$Res> {
  _$DusDataCopyWithImpl(this._value, this._then);

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
    Object? locationId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
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
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      foto: freezed == foto ? _value.foto : foto,
      idLocation: freezed == idLocation
          ? _value.idLocation
          : idLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_DusDataCopyWith<$Res> implements $DusDataCopyWith<$Res> {
  factory _$$_DusDataCopyWith(
          _$_DusData value, $Res Function(_$_DusData) then) =
      __$$_DusDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? nosj,
      @JsonKey(name: 'qrcode_sj') String? qrcodeSj,
      String? nodus,
      Object? foto,
      @JsonKey(name: 'id_location') String? idLocation,
      @JsonKey(name: 'location_id') String? locationId,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'nama_penerima') String? namaPenerima,
      @JsonKey(name: 'no_hp') String? noHp,
      String? lembaga,
      @JsonKey(name: 'nm_tempat') String? nmTempat,
      @JsonKey(name: 'detail_tempat') String? detailTempat,
      String? kelurahan,
      String? kecamatan,
      String? kabupaten,
      String? provinsi,
      @JsonKey(name: 'status_pengiriman') String? statusPengiriman,
      @JsonKey(name: 'created_by') String? createdBy,
      @JsonKey(name: 'updated_by') String? updatedBy,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$_DusDataCopyWithImpl<$Res>
    extends _$DusDataCopyWithImpl<$Res, _$_DusData>
    implements _$$_DusDataCopyWith<$Res> {
  __$$_DusDataCopyWithImpl(_$_DusData _value, $Res Function(_$_DusData) _then)
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
    Object? locationId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
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
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_DusData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      foto: freezed == foto ? _value.foto : foto,
      idLocation: freezed == idLocation
          ? _value.idLocation
          : idLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
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
class _$_DusData implements _DusData {
  const _$_DusData(
      {this.id,
      this.nosj,
      @JsonKey(name: 'qrcode_sj') this.qrcodeSj,
      this.nodus,
      this.foto,
      @JsonKey(name: 'id_location') this.idLocation,
      @JsonKey(name: 'location_id') this.locationId,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'nama_penerima') this.namaPenerima,
      @JsonKey(name: 'no_hp') this.noHp,
      this.lembaga,
      @JsonKey(name: 'nm_tempat') this.nmTempat,
      @JsonKey(name: 'detail_tempat') this.detailTempat,
      this.kelurahan,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      @JsonKey(name: 'status_pengiriman') this.statusPengiriman,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'updated_by') this.updatedBy,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_DusData.fromJson(Map<String, dynamic> json) =>
      _$$_DusDataFromJson(json);

  @override
  final String? id;
  @override
  final String? nosj;
  @override
  @JsonKey(name: 'qrcode_sj')
  final String? qrcodeSj;
  @override
  final String? nodus;
  @override
  final Object? foto;
  @override
  @JsonKey(name: 'id_location')
  final String? idLocation;
  @override
  @JsonKey(name: 'location_id')
  final String? locationId;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  @JsonKey(name: 'nama_penerima')
  final String? namaPenerima;
  @override
  @JsonKey(name: 'no_hp')
  final String? noHp;
  @override
  final String? lembaga;
  @override
  @JsonKey(name: 'nm_tempat')
  final String? nmTempat;
  @override
  @JsonKey(name: 'detail_tempat')
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
  @JsonKey(name: 'status_pengiriman')
  final String? statusPengiriman;
  @override
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @override
  @JsonKey(name: 'updated_by')
  final String? updatedBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DusData(id: $id, nosj: $nosj, qrcodeSj: $qrcodeSj, nodus: $nodus, foto: $foto, idLocation: $idLocation, locationId: $locationId, latitude: $latitude, longitude: $longitude, namaPenerima: $namaPenerima, noHp: $noHp, lembaga: $lembaga, nmTempat: $nmTempat, detailTempat: $detailTempat, kelurahan: $kelurahan, kecamatan: $kecamatan, kabupaten: $kabupaten, provinsi: $provinsi, statusPengiriman: $statusPengiriman, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DusData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nosj, nosj) || other.nosj == nosj) &&
            (identical(other.qrcodeSj, qrcodeSj) ||
                other.qrcodeSj == qrcodeSj) &&
            (identical(other.nodus, nodus) || other.nodus == nodus) &&
            const DeepCollectionEquality().equals(other.foto, foto) &&
            (identical(other.idLocation, idLocation) ||
                other.idLocation == idLocation) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
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
        nosj,
        qrcodeSj,
        nodus,
        const DeepCollectionEquality().hash(foto),
        idLocation,
        locationId,
        latitude,
        longitude,
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
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DusDataCopyWith<_$_DusData> get copyWith =>
      __$$_DusDataCopyWithImpl<_$_DusData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DusDataToJson(
      this,
    );
  }
}

abstract class _DusData implements DusData {
  const factory _DusData(
      {final String? id,
      final String? nosj,
      @JsonKey(name: 'qrcode_sj') final String? qrcodeSj,
      final String? nodus,
      final Object? foto,
      @JsonKey(name: 'id_location') final String? idLocation,
      @JsonKey(name: 'location_id') final String? locationId,
      final String? latitude,
      final String? longitude,
      @JsonKey(name: 'nama_penerima') final String? namaPenerima,
      @JsonKey(name: 'no_hp') final String? noHp,
      final String? lembaga,
      @JsonKey(name: 'nm_tempat') final String? nmTempat,
      @JsonKey(name: 'detail_tempat') final String? detailTempat,
      final String? kelurahan,
      final String? kecamatan,
      final String? kabupaten,
      final String? provinsi,
      @JsonKey(name: 'status_pengiriman') final String? statusPengiriman,
      @JsonKey(name: 'created_by') final String? createdBy,
      @JsonKey(name: 'updated_by') final String? updatedBy,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_DusData;

  factory _DusData.fromJson(Map<String, dynamic> json) = _$_DusData.fromJson;

  @override
  String? get id;
  @override
  String? get nosj;
  @override
  @JsonKey(name: 'qrcode_sj')
  String? get qrcodeSj;
  @override
  String? get nodus;
  @override
  Object? get foto;
  @override
  @JsonKey(name: 'id_location')
  String? get idLocation;
  @override
  @JsonKey(name: 'location_id')
  String? get locationId;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(name: 'nama_penerima')
  String? get namaPenerima;
  @override
  @JsonKey(name: 'no_hp')
  String? get noHp;
  @override
  String? get lembaga;
  @override
  @JsonKey(name: 'nm_tempat')
  String? get nmTempat;
  @override
  @JsonKey(name: 'detail_tempat')
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
  @JsonKey(name: 'status_pengiriman')
  String? get statusPengiriman;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'updated_by')
  String? get updatedBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DusDataCopyWith<_$_DusData> get copyWith =>
      throw _privateConstructorUsedError;
}
