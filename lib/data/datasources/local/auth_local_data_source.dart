import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [AuthModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<LoginResponse> getCachedLogin();

  Future<void> cacheLoginResponse(LoginResponse loginResponse);

  Future<void> deleteCachedLogin();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box authBox;

  AuthLocalDataSourceImpl({
    required this.authBox,
  });

  @override
  Future<void> cacheLoginResponse(LoginResponse loginResponse) async {
    // await authBox.put(cachedLoginResponse, loginResponse);
    await authBox.put(cachedLoginResponse, loginResponse.toJson());
    // print("authBox.get(cachedLoginResponse): ${authBox.get(cachedLoginResponse)}");
  }

  @override
  Future<LoginResponse> getCachedLogin() async {
    if (authBox.containsKey(cachedLoginResponse)) {
      final LoginResponse response = authBox.get(cachedLoginResponse);
      // print("authBox.get(cachedLoginResponse): ${authBox.get(cachedLoginResponse)}");
      return response;
      // return Future.value(response);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteCachedLogin() async {
    authBox.delete(cachedLoginResponse);
  }
}
