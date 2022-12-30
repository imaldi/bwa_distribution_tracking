// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_street_map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpenStreetMapResponse _$$_OpenStreetMapResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OpenStreetMapResponse(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osm_id'] as int?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      placeRank: json['place_rank'] as int?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
      addresstype: json['addresstype'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_OpenStreetMapResponseToJson(
        _$_OpenStreetMapResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'lat': instance.lat,
      'lon': instance.lon,
      'place_rank': instance.placeRank,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
      'addresstype': instance.addresstype,
      'name': instance.name,
      'display_name': instance.displayName,
      'address': instance.address,
      'boundingbox': instance.boundingbox,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      building: json['building'] as String?,
      houseNumber: json['house_number'] as String?,
      road: json['road'] as String?,
      cityBlock: json['city_block'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      municipality: json['municipality'] as String?,
      cityDistrict: json['city_district'] as String?,
      city: json['city'] as String?,
      iso31662Lvl4: json['ISO3166-2-lvl4'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'building': instance.building,
      'house_number': instance.houseNumber,
      'road': instance.road,
      'city_block': instance.cityBlock,
      'neighbourhood': instance.neighbourhood,
      'municipality': instance.municipality,
      'city_district': instance.cityDistrict,
      'city': instance.city,
      'ISO3166-2-lvl4': instance.iso31662Lvl4,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };
