import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
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
    // TODO tanya kenapa query params, ga di body
    final url = Uri.http(baseUrl, loginUrl, {
      'phone': phone,
      'password': password,
    });
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
