// To parse this JSON data, do
//
//     final kecamatanResponse = kecamatanResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<KecamatanResponse> kecamatanResponseFromJson(String str) => List<KecamatanResponse>.from(json.decode(str).map((x) => KecamatanResponse.fromJson(x)));

String kecamatanResponseToJson(List<KecamatanResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KecamatanResponse extends Equatable {
  KecamatanResponse({
    this.id,
    this.regencyId,
    this.name,
  });

  String? id;
  String? regencyId;
  String? name;

  factory KecamatanResponse.fromJson(Map<String, dynamic> json) => KecamatanResponse(
    id: json["id"],
    regencyId: json["regency_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "regency_id": regencyId,
    "name": name,
  };

  @override
  List<Object?> get props => [
    id,regencyId,name
  ];
}
