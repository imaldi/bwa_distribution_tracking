import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/scan_user_history_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_data_model.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/send_scan_response.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

abstract class QRScanRemoteDataSource {
  Future<BulkScanResponse> bulkScan(String qrcodeSj);
  Future<SendScanResponse> sendScan(SendScanDataModel model);
  Future<ScanUserHistoryResponse> getUserScanHistory();
  Future<ScanUserHistoryResponse> getAllScanHistory();
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
    } if(response.statusCode == 404){
      throw DataNotFoundException();
    } else {
      throw ServerException();
    }
  }

  // FIXME ada error kalau ngambil foto dua kali atau ganti orientasi layar
  @override
  Future<SendScanResponse> sendScan(SendScanDataModel model) async {
    final url = Uri.https(baseUrl, storeUrl);
    print("Send Scan Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    print("status_pengiriman: ${ model.statusPengiriman ?? ""}");
    print("latitude di data source: ${ model.latitude ?? ""}");
    print("longtitude di data source: ${ model.longtitude ?? ""}");
    print("latitude from sendScan in remote data source: ${model.latitude}");
    var bodyMap = {
      // "qrcode_sj": model. ?? "-",
      "nosj": model.nosj ?? "-",
      "qrcode_sj": model.qrCodeSJ ?? "-",
      "latitude": model.latitude ?? "-",
      "longtitude": model.longtitude ?? "-",
      "alamat": model.alamat ?? "-",
      "kota": model.kota ?? "-",
      "keterangan": model.keterangan ?? "-",
      // "foto": "asdasd",
      "status_pengiriman": model.statusPengiriman ?? "-",
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

    // TODO perbaiki response kalau hasilnya not found
    if (response.statusCode == 200) {
      var theResponse = SendScanResponse(success: true, data: model);
      return theResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ScanUserHistoryResponse> getUserScanHistory() async {
    final url = Uri.https(baseUrl, historyUser);
    print("User Scan History Url: $url");
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
    print("History Scan User response code: ${response.statusCode.toString()}");
    log("History Scan User response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    if (response.statusCode == 200) {
    var theResponse = ScanUserHistoryResponse.fromJson(jsonDecode(response.body));
    return theResponse;
    } else {
    throw ServerException();
    }
  }

  @override
  Future<ScanUserHistoryResponse> getAllScanHistory() async {
    final url = Uri.https(baseUrl, historyAll);
    print("All Scan History Url: $url");
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
    print("History Scan User response code: ${response.statusCode.toString()}");
    log("History Scan User response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    if (response.statusCode == 200) {
      var theResponse = ScanUserHistoryResponse.fromJson(jsonDecode(response.body));
      return theResponse;
    } else {
      throw ServerException();
    }
  }
}
