import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:hive/hive.dart';

import '../../../injection_container.dart';

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
  final Box<LoginResponse> authBox;

  AuthLocalDataSourceImpl({
    required this.authBox,
  });

  @override
  Future<void> cacheLoginResponse(LoginResponse loginResponse) async {
    // await authBox.put(cachedLoginResponse, loginResponse);
    // var authBox = sl<Box<LoginResponse>>(); // gini harusnya
    await authBox.put(cachedLoginResponse, loginResponse);
    print(
        "authBox.get(cachedLoginResponse) token Auth DS: ${authBox.get(cachedLoginResponse)?.token ?? ""}");
  }

  @override
  Future<LoginResponse> getCachedLogin() async {
    if (authBox.containsKey(cachedLoginResponse)) {
      final LoginResponse response =
          authBox.get(cachedLoginResponse) ?? const LoginResponse();
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
    // authBox.clear();
  }
}
