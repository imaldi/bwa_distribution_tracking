import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';

abstract class AuthRemoteDataSource {
  /// Calls the login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponse> login(String? phone, String? password);
}