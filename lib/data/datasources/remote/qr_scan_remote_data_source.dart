import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class QRScanRemoteDataSource {
  Future<BulkScanResponse> bulkScan(String qrcodeSj);
  Future<SendScanResponse> sendScan(SendScanDataModel model);
}

class QRScanRemoteDataSourceImpl extends QRScanRemoteDataSource {
  final http.Client client;
  final Box<LoginResponse> authBox;

  QRScanRemoteDataSourceImpl({required this.client, required this.authBox});

  @override
  Future<BulkScanResponse> bulkScan(String qrcodeSj) async {
    final url = Uri.https(baseUrl, "$scanUrl/$qrcodeSj");
    print("Bulk Scan Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    print("token: $token");
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("Bulk Scan response code: ${response.statusCode.toString()}");
    log("Bulk Scan response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    if (response.statusCode == 200) {
      var theResponse = BulkScanResponse.fromJson(jsonDecode(response.body));
      var isResponseDataNull = theResponse.data == null;
      if (isResponseDataNull) {
        throw ServerException();
      }
      return theResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SendScanResponse> sendScan(SendScanDataModel model) async {
    final url = Uri.https(baseUrl, "$storeUrl");
    print("Send Scan Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    print("token: $token");
    print("latitude from sendScan in remote data source: ${model.latitude}");
    var bodyMap = {
      "nosj": model.nosj ?? "asdas",
      "latitude": model.latitude ?? "",
      "longtitude": model.longtitude ?? "",
      "alamat": model.alamat ?? "asdas",
      "kota": model.kota ?? "asdas",
      "keterangan": model.keterangan ?? "asdasd",
      // "foto": "asdasd",
      "status_pengiriman": model.statusPengiriman ?? "asdsa",
    };
    final request = http.MultipartRequest("POST", url);
    // var theImage = File(model.foto ?? "");

    if ((model.foto ?? "").isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'foto', model.foto!));
    }
    request.fields.addAll(bodyMap);
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      // 'Content-Type': 'application/json'
    });
    final response =
    await http.Response.fromStream(await request.send());
    print("Bulk Scan response code: ${response.statusCode.toString()}");
    log("Bulk Scan response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    if (response.statusCode == 200) {
      var theResponse = SendScanResponse(success: true, data: model);
      return theResponse;
    } else {
      throw ServerException();
    }
  }
}
