// To parse this JSON data, do
//
//     final kabupatenKotaResponse = kabupatenKotaResponseFromJson(jsonString);

import 'dart:convert';

List<KabupatenKotaResponse> kabupatenKotaResponseFromJson(String str) => List<KabupatenKotaResponse>.from(json.decode(str).map((x) => KabupatenKotaResponse.fromJson(x)));

String kabupatenKotaResponseToJson(List<KabupatenKotaResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KabupatenKotaResponse {
  KabupatenKotaResponse({
    this.id,
    this.provinceId,
    this.name,
  });

  String? id;
  String? provinceId;
  String? name;

  factory KabupatenKotaResponse.fromJson(Map<String, dynamic> json) => KabupatenKotaResponse(
    id: json["id"],
    provinceId: json["province_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "province_id": provinceId,
    "name": name,
  };
}
