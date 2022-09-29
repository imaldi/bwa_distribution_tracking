import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [AuthModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<LoginResponse> getCachedLogin();

  Future<LoginResponse?> getCachedLoginOrNull();

  Future<void> cacheLoginResponse(LoginResponse loginResponse);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box authBox;

  AuthLocalDataSourceImpl({
    required this.authBox,
  });

  @override
  Future<void> cacheLoginResponse(LoginResponse loginResponse) async {
    await authBox.put(cachedLoginResponse, loginResponse);
  }

  @override
  Future<LoginResponse> getCachedLogin() async {
    final response = await getCachedLoginOrNull();
    if (response == null) throw CacheException();
    // TODO: if (!response.isValid) throw CacheInvalid();
    return response;
  }

  @override
  Future<LoginResponse?> getCachedLoginOrNull() async {
    if (!authBox.containsKey(cachedLoginResponse)) {
      return null;
    }
    return authBox.get(cachedLoginResponse);
  }
}
