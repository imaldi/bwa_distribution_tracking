// To parse this JSON data, do
//
//     final provinceResponse = provinceResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ProvinceResponse> provinceResponseFromJson(String str) => List<ProvinceResponse>.from(json.decode(str).map((x) => ProvinceResponse.fromJson(x)));

String provinceResponseToJson(List<ProvinceResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinceResponse extends Equatable{
  ProvinceResponse({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) => ProvinceResponse(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  @override
  List<Object?> get props => [
    id,
    name
  ];
}
