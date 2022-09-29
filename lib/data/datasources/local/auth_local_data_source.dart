import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [AuthModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<LoginResponse> getCachedLogin();

  Future<void> cacheLoginResponse(LoginResponse loginResponse);
}

// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   final SharedPreferences sharedPreferences;
//
//   AuthLocalDataSourceImpl({required this.sharedPreferences});
//
//   // factory AuthLocalDataSourceImpl.withExternalSharedPref(SharedPreferences sharedPreferences){
//   //   return  AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences);
//   // }
//
//   // @override
//   // Future<AuthModel> getLastAuth() {
//   //   final jsonString = sharedPreferences.getString(cachedAuth);
//   //   if(jsonString != null){
//   //     return Future.value(
//   //         AuthModel.fromJson(json.decode(jsonString)));
//   //   } else {
//   //     throw CacheException();
//   //   }
//   // }
//   //
//   // @override
//   // Future<void> cacheAuth(AuthModel triviaToCache) {
//   //   return sharedPreferences.setString(cachedAuth, json.encode(triviaToCache.toJson()));
//   // }
//
//   @override
//   Future<void> cacheLoginResponse(LoginResponse loginResponse) {
//     // TODO: implement cacheLoginResponse
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<LoginResponse> getCachedLogin() {
//     // TODO: implement getCachedLogin
//     throw UnimplementedError();
//   }
// }