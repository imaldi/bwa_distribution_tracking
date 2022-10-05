import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/bulk_scan_response.dart';
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
    final response = await client.post(
      url,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return BulkScanResponse.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

}