import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_list_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/dus_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:hive/hive.dart';

import '../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../../core/resources/consts/strings.dart';
import '../../../core/resources/consts/urls.dart';
import '../../models/auth/login_response.dart';

abstract class SingleScanRemoteDataSource {
  Future<StoreSelesaiResponse> sendRequestStoreSelesai(StoreSelesaiResponse model);
  Future<DusScanResponse> sendRequestScanSingleDusInsert(String nodus, String imagePath,
      int currentDusNumber,
      // StoreSelesaiResponse wholeFormData
      );
  // Future<DusListResponse> fetchScannedDusList();
}

class SingleScanRemoteDataSourceImpl extends SingleScanRemoteDataSource {
  final Box<LoginResponse> authBox;

  SingleScanRemoteDataSourceImpl(this.authBox);
  @override
  Future<StoreSelesaiResponse> sendRequestStoreSelesai(StoreSelesaiResponse model) async {
    final url = Uri.https(baseUrl, "$storeSelesaiUrl/${model.header?.qrcodeSj ?? "0"}");
    print("Store Selesai Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    final request = http.MultipartRequest("POST", url);
    // var theImage = File(model.foto ?? "");

    if ((model.header?.foto is String) && (model.header?.foto.toString() ?? "").isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'foto', model.header?.foto?.toString() ?? "-"));

    }
    print("model Param: ${model.toJson().toString()}");
    var bodyMap = <String,String>{}..addAll(
      model.header?.toJson().map((key, value) => MapEntry<String,String>(key, value.toString())) ?? <String,String>{}
    )
      // ..remove("foto")
    ;
    print("bodyMap: $bodyMap");

    request.fields.addAll(bodyMap);
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      // 'Content-Type': 'application/json'
    });
    final response =
    await http.Response.fromStream(await request.send());
    print("Selesai Store response code: ${response.statusCode.toString()}");
    log("Selesai Store response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    // TODO perbaiki response kalau hasilnya not found
    if (response.statusCode == 200) {
      var theResponse = StoreSelesaiResponse.fromJson(jsonDecode(response.body));
      return theResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DusScanResponse> sendRequestScanSingleDusInsert(String nodus, String imagePath,
      int currentDusNumber,
      // StoreSelesaiResponse wholeFormData
      ) async {
    // final url = Uri.https(baseUrl, "$scanInsertDusUrl/$nodus-$currentDusNumber");
    final url = Uri.https(baseUrl, "$scanInsertDusUrl/$nodus");
    print("sendRequestScanSingleDusInsert Url: $url");
    // final box = Hive.box(authBoxKey);
    final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
    final request = http.MultipartRequest("POST", url);
    // var theImage = File(model.foto ?? "");

    if (imagePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'foto', imagePath));
    }
    // print("imagePath Param: ${imagePath}");
    // var bodyMap = <String,String>{}..addAll(
    //     wholeFormData.header?.toJson().map((key, value) => MapEntry<String,String>(key, value.toString())) ?? <String,String>{}
    // )
    // ..remove("foto")
        ;
    // print("bodyMap: $bodyMap");
    //
    // request.fields.addAll(bodyMap);
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      // 'Content-Type': 'application/json'
    });
    final response =
    await http.Response.fromStream(await request.send());
    print("sendRequestScanSingleDusInsert response code: ${response.statusCode.toString()}");
    log("sendRequestScanSingleDusInsert response body: ${response.body.toString()}");

    // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
    // TODO perbaiki response kalau hasilnya not found
    if (response.statusCode == 200) {
      var theResponse = DusScanResponse.fromJson(jsonDecode(response.body));
      return theResponse;
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<DusListResponse> fetchScannedDusList() async {
  //   final url = Uri.https(baseUrl, "$suratJalanUrl", {"page": pageNumber.toString()});
  //   print("Surat Jalan Url: $url");
  //   // final box = Hive.box(authBoxKey);
  //   final token = authBox.get(cachedLoginResponse)?.token?.token ?? "";
  //   print("token: $token");
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //     },
  //   );
  //   print("Bulk Scan response code: ${response.statusCode.toString()}");
  //   log("Bulk Scan response body: ${response.body.toString()}");
  //
  //   // FIXME bilang mas bambang kalau not found code nya jangan 500, terlalu ga jelas
  //   if (response.statusCode == 200) {
  //     var theResponse = SuratJalanResponse.fromJson(jsonDecode(response.body));
  //     var isResponseDataNull = theResponse.data == null;
  //     if (isResponseDataNull) {
  //       throw ServerException();
  //     }
  //     return theResponse;
  //   } else {
  //     throw ServerException();
  //   }
  // }

}