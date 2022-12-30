// To parse this JSON data, do
//
//     final openStreetMapResponse = openStreetMapResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'open_street_map_response.freezed.dart';
part 'open_street_map_response.g.dart';

OpenStreetMapResponse openStreetMapResponseFromJson(String str) => OpenStreetMapResponse.fromJson(json.decode(str));

String openStreetMapResponseToJson(OpenStreetMapResponse data) => json.encode(data.toJson());

@freezed
class OpenStreetMapResponse with _$OpenStreetMapResponse {
  const factory OpenStreetMapResponse({
    @JsonKey(name: "place_id") int? placeId,
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
    List<String>? boundingbox,
  }) = _OpenStreetMapResponse;

  factory OpenStreetMapResponse.fromJson(Map<String, dynamic> json) => _$OpenStreetMapResponseFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    String? building,
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
    @JsonKey(name: "country_code") String? countryCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}