// To parse this JSON data, do
//
//     final kelurahanResponse = kelurahanResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<KelurahanResponse> kelurahanResponseFromJson(String str) => List<KelurahanResponse>.from(json.decode(str).map((x) => KelurahanResponse.fromJson(x)));

String kelurahanResponseToJson(List<KelurahanResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KelurahanResponse extends Equatable {
  KelurahanResponse({
    this.id,
    this.districtId,
    this.name,
  });

  String? id;
  String? districtId;
  String? name;

  factory KelurahanResponse.fromJson(Map<String, dynamic> json) => KelurahanResponse(
    id: json["id"],
    districtId: json["district_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "district_id": districtId,
    "name": name,
  };

  @override
  List<Object?> get props => [id,districtId,name];
}