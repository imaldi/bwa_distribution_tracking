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
  Future<LoginResponse> login(String phone, String password,
      {String? csrf_token}) async {
    final url = Uri.http(baseUrl, loginUrl);
    print("URL login remote data source: $url");

    var requestHeaders = {'Accept': 'application/json'};
    if (csrf_token != null) {
      requestHeaders['X-CSRF-TOKEN'] = csrf_token;
    }
    final response = await client.post(
      url,
      headers: requestHeaders,
      body: {
        'phone': phone,
        'password': password,
      },
    ).timeout(const Duration(seconds: 5), onTimeout: () {
      throw TimeoutException("Ini ada yang salah");
    });

    print("Response Login status code: ${response.statusCode}");
    print("Response Login headers: ${response.headers}");
    print("Response Login: ${response.body}");

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
    // else if (response.statusCode == 419) {
    //   // TODO save ke shared pref nanti
    //   // Extract the CSRF token from the Set-Cookie header
    //   var setCookieHeader = response.headers['set-cookie'];
    //   if (setCookieHeader != null) {
    //     // Extract the CSRF token from the Set-Cookie header value
    //     var matches =
    //         RegExp(r'laravel_session=([^;]+);').allMatches(setCookieHeader);
    //     if (matches.isNotEmpty) {
    //       var csrfToken = matches.first.group(1);
    //       print("CSRF from else if: $csrfToken");
    //       login(phone, password, csrf_token: csrfToken);
    //       // return csrfToken;
    //     }
    //   }
    //
    //   // Throw exception when CSRF token is not found
    //   throw ServerException();
    // }
    else {
      throw ServerException();
    }
  }
}
