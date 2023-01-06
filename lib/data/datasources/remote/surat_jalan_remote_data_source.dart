import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_detail_response.dart';
import 'package:hive/hive.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/resources/consts/strings.dart';
import '../../../core/resources/consts/urls.dart';
import '../../models/auth/login_response.dart';
import '../../models/qr_scan/bulk_scan_response.dart';
import '../../models/surat_jalan/surat_jalan_response.dart';
import 'package:http/http.dart' as http;

abstract class SuratJalanRemoteDataSource {
  Future<SuratJalanResponse> getSuratJalanPerPage(int pageNumber);
  Future<BulkScanResponse> getHistoryPerId(String qrcodeSj);
  Future<DusDetailResponse> getDusDetailByQrCodeSJ(String qrcodeSj);
}

class SuratJalanRemoteDataSourceImpl extends SuratJalanRemoteDataSource {
  final http.Client client;
  final Box<LoginResponse> authBox;

  SuratJalanRemoteDataSourceImpl(this.client, this.authBox);
  @override
  Future<SuratJalanResponse> getSuratJalanPerPage(int pageNumber) async {
    final url = Uri.https(baseUrl, "$suratJalanUrl", {"page": pageNumber.toString()});
    print("Surat Jalan Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    // print("token: $token");
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("Surat Jalan Riwayat response code: ${response.statusCode.toString()}");
    log("Surat Jalan Riwayat scan response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    if (response.statusCode == 200) {
      var theResponse = SuratJalanResponse.fromJson(jsonDecode(response.body));
      print("response in summarysj: $theResponse");
      var isResponseDataNull = theResponse.data == null;
      if (isResponseDataNull) {
        throw ServerException();
      }
      return theResponse;
    } else {
      print("Error in summarysj");
      throw ServerException();
    }
  }

  @override
  Future<BulkScanResponse> getHistoryPerId(String qrcodeSj) async {
    final url = Uri.https(baseUrl, "$historyPerId/$qrcodeSj");
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
    print("get history per id response code: ${response.statusCode.toString()}");
    log("get history per id response body: ${response.body.toString()}");

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
  @override
  Future<DusDetailResponse> getDusDetailByQrCodeSJ(String qrcodeSj) async {
    final url = Uri.https(baseUrl, "$dusDetailPopUp/$qrcodeSj");
    print("Dus Detail Url: $url");

    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("dus detail by qrcode response code: ${response.statusCode.toString()}");
    log("dus detail by qrcode response body: ${response.body.toString()}");

    if (response.statusCode == 200) {
      var theResponse = DusDetailResponse.fromJson(jsonDecode(response.body));
      return theResponse;
    } if(response.statusCode == 404){
      throw DataNotFoundException();
    } else {
      throw ServerException();
    }
  }
}
