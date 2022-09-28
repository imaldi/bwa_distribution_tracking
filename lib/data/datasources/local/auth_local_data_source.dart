import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  // TODO change after test
  Future<LoginResponse>? getCachedLogin();

  // TODO change after test
  Future<void>? cacheLoginResponse(LoginResponse? loginResponse);
}