import 'dart:async';
import 'dart:convert';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  /// Calls the login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponse> login(String phone, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginResponse> login(String phone, String password) async {
    final url = Uri.http(baseUrl, loginUrl);
    print("URL login remote data source: $url");
    final response = await client.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'phone': phone,
        'password': password,
      },
    ).timeout(const Duration(seconds: 5), onTimeout: (){
      throw TimeoutException("Ini ada yang salah");
    });

    print("Response Login: $response");

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
