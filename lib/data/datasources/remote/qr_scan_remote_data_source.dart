import 'dart:convert';
import 'dart:developer';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

abstract class QRScanRemoteDataSource {
  Future<BulkScanResponse> bulkScan(String qrcodeSj);
}

class QRScanRemoteDataSourceImpl extends QRScanRemoteDataSource {
  final http.Client client;
  final Box<LoginResponse> authBox;


  QRScanRemoteDataSourceImpl({required this.client, required this.authBox});

  @override
  Future<BulkScanResponse> bulkScan(String qrcodeSj) async {
    final url = Uri.http(baseUrl, "$scanUrl/$qrcodeSj");
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

    if (response.statusCode == 200) {
      var theResponse = BulkScanResponse.fromJson(jsonDecode(response.body));
      var isResponseDataNull = theResponse.data == null;
      if(isResponseDataNull) {
        throw ServerException();
      }
      return theResponse;
    } else {
      throw ServerException();
    }
  }

}