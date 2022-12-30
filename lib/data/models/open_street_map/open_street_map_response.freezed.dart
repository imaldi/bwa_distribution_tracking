// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'open_street_map_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpenStreetMapResponse _$OpenStreetMapResponseFromJson(
    Map<String, dynamic> json) {
  return _OpenStreetMapResponse.fromJson(json);
}

/// @nodoc
mixin _$OpenStreetMapResponse {
  @JsonKey(name: "place_id")
  int? get placeId => throw _privateConstructorUsedError;
  String? get licence => throw _privateConstructorUsedError;
  @JsonKey(name: "osm_type")
  String? get osmType => throw _privateConstructorUsedError;
  @JsonKey(name: "osm_id")
  int? get osmId => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: "place_rank")
  int? get placeRank => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  double? get importance => throw _privateConstructorUsedError;
  String? get addresstype => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "display_name")
  String? get displayName => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  List<String>? get boundingbox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenStreetMapResponseCopyWith<OpenStreetMapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenStreetMapResponseCopyWith<$Res> {
  factory $OpenStreetMapResponseCopyWith(OpenStreetMapResponse value,
          $Res Function(OpenStreetMapResponse) then) =
      _$OpenStreetMapResponseCopyWithImpl<$Res, OpenStreetMapResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "place_id") int? placeId,
      String? licence,
      @JsonKey(name: "osm_type") String? osmType,
      @JsonKey(name: "osm_id") int? osmId,
      String? lat,
      String? lon,
      @JsonKey(name: "place_rank") int? placeRank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      @JsonKey(name: "display_name") String? displayName,
      Address? address,
      List<String>? boundingbox});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$OpenStreetMapResponseCopyWithImpl<$Res,
        $Val extends OpenStreetMapResponse>
    implements $OpenStreetMapResponseCopyWith<$Res> {
  _$OpenStreetMapResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? licence = freezed,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? placeRank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? address = freezed,
    Object? boundingbox = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int?,
      licence: freezed == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      placeRank: freezed == placeRank
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: freezed == addresstype
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      boundingbox: freezed == boundingbox
          ? _value.boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OpenStreetMapResponseCopyWith<$Res>
    implements $OpenStreetMapResponseCopyWith<$Res> {
  factory _$$_OpenStreetMapResponseCopyWith(_$_OpenStreetMapResponse value,
          $Res Function(_$_OpenStreetMapResponse) then) =
      __$$_OpenStreetMapResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "place_id") int? placeId,
      String? licence,
      @JsonKey(name: "osm_type") String? osmType,
      @JsonKey(name: "osm_id") int? osmId,
      String? lat,
      String? lon,
      @JsonKey(name: "place_rank") int? placeRank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      @JsonKey(name: "display_name") String? displayName,
      Address? address,
      List<String>? boundingbox});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_OpenStreetMapResponseCopyWithImpl<$Res>
    extends _$OpenStreetMapResponseCopyWithImpl<$Res, _$_OpenStreetMapResponse>
    implements _$$_OpenStreetMapResponseCopyWith<$Res> {
  __$$_OpenStreetMapResponseCopyWithImpl(_$_OpenStreetMapResponse _value,
      $Res Function(_$_OpenStreetMapResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? licence = freezed,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? placeRank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? address = freezed,
    Object? boundingbox = freezed,
  }) {
    return _then(_$_OpenStreetMapResponse(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int?,
      licence: freezed == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      placeRank: freezed == placeRank
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: freezed == addresstype
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      boundingbox: freezed == boundingbox
          ? _value._boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OpenStreetMapResponse implements _OpenStreetMapResponse {
  const _$_OpenStreetMapResponse(
      {@JsonKey(name: "place_id") this.placeId,
      this.licence,
      @JsonKey(name: "osm_type") this.osmType,
      @JsonKey(name: "osm_id") this.osmId,
      this.lat,
      this.lon,
      @JsonKey(name: "place_rank") this.placeRank,
      this.category,
      this.type,
      this.importance,
      this.addresstype,
      this.name,
      @JsonKey(name: "display_name") this.displayName,
      this.address,
      final List<String>? boundingbox})
      : _boundingbox = boundingbox;

  factory _$_OpenStreetMapResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OpenStreetMapResponseFromJson(json);

  @override
  @JsonKey(name: "place_id")
  final int? placeId;
  @override
  final String? licence;
  @override
  @JsonKey(name: "osm_type")
  final String? osmType;
  @override
  @JsonKey(name: "osm_id")
  final int? osmId;
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  @JsonKey(name: "place_rank")
  final int? placeRank;
  @override
  final String? category;
  @override
  final String? type;
  @override
  final double? importance;
  @override
  final String? addresstype;
  @override
  final String? name;
  @override
  @JsonKey(name: "display_name")
  final String? displayName;
  @override
  final Address? address;
  final List<String>? _boundingbox;
  @override
  List<String>? get boundingbox {
    final value = _boundingbox;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OpenStreetMapResponse(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, lat: $lat, lon: $lon, placeRank: $placeRank, category: $category, type: $type, importance: $importance, addresstype: $addresstype, name: $name, displayName: $displayName, address: $address, boundingbox: $boundingbox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenStreetMapResponse &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.licence, licence) || other.licence == licence) &&
            (identical(other.osmType, osmType) || other.osmType == osmType) &&
            (identical(other.osmId, osmId) || other.osmId == osmId) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.placeRank, placeRank) ||
                other.placeRank == placeRank) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.addresstype, addresstype) ||
                other.addresstype == addresstype) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._boundingbox, _boundingbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      licence,
      osmType,
      osmId,
      lat,
      lon,
      placeRank,
      category,
      type,
      importance,
      addresstype,
      name,
      displayName,
      address,
      const DeepCollectionEquality().hash(_boundingbox));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenStreetMapResponseCopyWith<_$_OpenStreetMapResponse> get copyWith =>
      __$$_OpenStreetMapResponseCopyWithImpl<_$_OpenStreetMapResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpenStreetMapResponseToJson(
      this,
    );
  }
}

abstract class _OpenStreetMapResponse implements OpenStreetMapResponse {
  const factory _OpenStreetMapResponse(
      {@JsonKey(name: "place_id") final int? placeId,
      final String? licence,
      @JsonKey(name: "osm_type") final String? osmType,
      @JsonKey(name: "osm_id") final int? osmId,
      final String? lat,
      final String? lon,
      @JsonKey(name: "place_rank") final int? placeRank,
      final String? category,
      final String? type,
      final double? importance,
      final String? addresstype,
      final String? name,
      @JsonKey(name: "display_name") final String? displayName,
      final Address? address,
      final List<String>? boundingbox}) = _$_OpenStreetMapResponse;

  factory _OpenStreetMapResponse.fromJson(Map<String, dynamic> json) =
      _$_OpenStreetMapResponse.fromJson;

  @override
  @JsonKey(name: "place_id")
  int? get placeId;
  @override
  String? get licence;
  @override
  @JsonKey(name: "osm_type")
  String? get osmType;
  @override
  @JsonKey(name: "osm_id")
  int? get osmId;
  @override
  String? get lat;
  @override
  String? get lon;
  @override
  @JsonKey(name: "place_rank")
  int? get placeRank;
  @override
  String? get category;
  @override
  String? get type;
  @override
  double? get importance;
  @override
  String? get addresstype;
  @override
  String? get name;
  @override
  @JsonKey(name: "display_name")
  String? get displayName;
  @override
  Address? get address;
  @override
  List<String>? get boundingbox;
  @override
  @JsonKey(ignore: true)
  _$$_OpenStreetMapResponseCopyWith<_$_OpenStreetMapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get building => throw _privateConstructorUsedError;
  @JsonKey(name: "house_number")
  String? get houseNumber => throw _privateConstructorUsedError;
  String? get road => throw _privateConstructorUsedError;
  @JsonKey(name: "city_block")
  String? get cityBlock => throw _privateConstructorUsedError;
  String? get neighbourhood => throw _privateConstructorUsedError;
  String? get municipality => throw _privateConstructorUsedError;
  @JsonKey(name: "city_district")
  String? get cityDistrict => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "ISO3166-2-lvl4")
  String? get iso31662Lvl4 => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? building,
      @JsonKey(name: "house_number") String? houseNumber,
      String? road,
      @JsonKey(name: "city_block") String? cityBlock,
      String? neighbourhood,
      String? municipality,
      @JsonKey(name: "city_district") String? cityDistrict,
      String? city,
      @JsonKey(name: "ISO3166-2-lvl4") String? iso31662Lvl4,
      String? postcode,
      String? country,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? building = freezed,
    Object? houseNumber = freezed,
    Object? road = freezed,
    Object? cityBlock = freezed,
    Object? neighbourhood = freezed,
    Object? municipality = freezed,
    Object? cityDistrict = freezed,
    Object? city = freezed,
    Object? iso31662Lvl4 = freezed,
    Object? postcode = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      road: freezed == road
          ? _value.road
          : road // ignore: cast_nullable_to_non_nullable
              as String?,
      cityBlock: freezed == cityBlock
          ? _value.cityBlock
          : cityBlock // ignore: cast_nullable_to_non_nullable
              as String?,
      neighbourhood: freezed == neighbourhood
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      cityDistrict: freezed == cityDistrict
          ? _value.cityDistrict
          : cityDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31662Lvl4: freezed == iso31662Lvl4
          ? _value.iso31662Lvl4
          : iso31662Lvl4 // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? building,
      @JsonKey(name: "house_number") String? houseNumber,
      String? road,
      @JsonKey(name: "city_block") String? cityBlock,
      String? neighbourhood,
      String? municipality,
      @JsonKey(name: "city_district") String? cityDistrict,
      String? city,
      @JsonKey(name: "ISO3166-2-lvl4") String? iso31662Lvl4,
      String? postcode,
      String? country,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? building = freezed,
    Object? houseNumber = freezed,
    Object? road = freezed,
    Object? cityBlock = freezed,
    Object? neighbourhood = freezed,
    Object? municipality = freezed,
    Object? cityDistrict = freezed,
    Object? city = freezed,
    Object? iso31662Lvl4 = freezed,
    Object? postcode = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$_Address(
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      road: freezed == road
          ? _value.road
          : road // ignore: cast_nullable_to_non_nullable
              as String?,
      cityBlock: freezed == cityBlock
          ? _value.cityBlock
          : cityBlock // ignore: cast_nullable_to_non_nullable
              as String?,
      neighbourhood: freezed == neighbourhood
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      cityDistrict: freezed == cityDistrict
          ? _value.cityDistrict
          : cityDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31662Lvl4: freezed == iso31662Lvl4
          ? _value.iso31662Lvl4
          : iso31662Lvl4 // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  const _$_Address(
      {this.building,
      @JsonKey(name: "house_number") this.houseNumber,
      this.road,
      @JsonKey(name: "city_block") this.cityBlock,
      this.neighbourhood,
      this.municipality,
      @JsonKey(name: "city_district") this.cityDistrict,
      this.city,
      @JsonKey(name: "ISO3166-2-lvl4") this.iso31662Lvl4,
      this.postcode,
      this.country,
      @JsonKey(name: "country_code") this.countryCode});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final String? building;
  @override
  @JsonKey(name: "house_number")
  final String? houseNumber;
  @override
  final String? road;
  @override
  @JsonKey(name: "city_block")
  final String? cityBlock;
  @override
  final String? neighbourhood;
  @override
  final String? municipality;
  @override
  @JsonKey(name: "city_district")
  final String? cityDistrict;
  @override
  final String? city;
  @override
  @JsonKey(name: "ISO3166-2-lvl4")
  final String? iso31662Lvl4;
  @override
  final String? postcode;
  @override
  final String? country;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;

  @override
  String toString() {
    return 'Address(building: $building, houseNumber: $houseNumber, road: $road, cityBlock: $cityBlock, neighbourhood: $neighbourhood, municipality: $municipality, cityDistrict: $cityDistrict, city: $city, iso31662Lvl4: $iso31662Lvl4, postcode: $postcode, country: $country, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.road, road) || other.road == road) &&
            (identical(other.cityBlock, cityBlock) ||
                other.cityBlock == cityBlock) &&
            (identical(other.neighbourhood, neighbourhood) ||
                other.neighbourhood == neighbourhood) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.cityDistrict, cityDistrict) ||
                other.cityDistrict == cityDistrict) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.iso31662Lvl4, iso31662Lvl4) ||
                other.iso31662Lvl4 == iso31662Lvl4) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      building,
      houseNumber,
      road,
      cityBlock,
      neighbourhood,
      municipality,
      cityDistrict,
      city,
      iso31662Lvl4,
      postcode,
      country,
      countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String? building,
      @JsonKey(name: "house_number") final String? houseNumber,
      final String? road,
      @JsonKey(name: "city_block") final String? cityBlock,
      final String? neighbourhood,
      final String? municipality,
      @JsonKey(name: "city_district") final String? cityDistrict,
      final String? city,
      @JsonKey(name: "ISO3166-2-lvl4") final String? iso31662Lvl4,
      final String? postcode,
      final String? country,
      @JsonKey(name: "country_code") final String? countryCode}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get building;
  @override
  @JsonKey(name: "house_number")
  String? get houseNumber;
  @override
  String? get road;
  @override
  @JsonKey(name: "city_block")
  String? get cityBlock;
  @override
  String? get neighbourhood;
  @override
  String? get municipality;
  @override
  @JsonKey(name: "city_district")
  String? get cityDistrict;
  @override
  String? get city;
  @override
  @JsonKey(name: "ISO3166-2-lvl4")
  String? get iso31662Lvl4;
  @override
  String? get postcode;
  @override
  String? get country;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
