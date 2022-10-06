import 'dart:developer';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/injection_container.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

abstract class QRScanRemoteDataSource {
  Future<BulkScanResponse> bulkScan(String qrcodeSj);
}

class QRScanRemoteDataSourceImpl extends QRScanRemoteDataSource {
  final http.Client client;

  QRScanRemoteDataSourceImpl({required this.client});

  @override
  Future<BulkScanResponse> bulkScan(String qrcodeSj) async {
    final url = Uri.http(baseUrl, "$scanUrl/$qrcodeSj");
    print("Bulk Scan Url: $url");
    final box = Hive.box(authBoxKey);
    final token = box.get(cachedLoginResponse)["token"]["token"];
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
      return BulkScanResponse.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

}