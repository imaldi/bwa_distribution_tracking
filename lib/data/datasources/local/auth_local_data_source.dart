import 'dart:convert';

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

  Future<void> cacheLoginResponse(LoginResponse loginResponse);
}

// TODO open box in main() later
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // final SharedPreferences sharedPreferences;
  final HiveInterface hiveInterface;
  // box = Hive.box('myBox');

  AuthLocalDataSourceImpl({required this.hiveInterface});

  // factory AuthLocalDataSourceImpl.withExternalSharedPref(SharedPreferences sharedPreferences){
  //   return  AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  // }

  // @override
  // Future<AuthModel> getLastAuth() {
  //   final jsonString = sharedPreferences.getString(cachedAuth);
  //   if(jsonString != null){
  //     return Future.value(
  //         AuthModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw CacheException();
  //   }
  // }
  //
  // @override
  // Future<void> cacheAuth(AuthModel triviaToCache) {
  //   return sharedPreferences.setString(cachedAuth, json.encode(triviaToCache.toJson()));
  // }

  @override
  Future<void> cacheLoginResponse(LoginResponse loginResponse) async {
    var box = await hiveInterface.openBox(authBoxKey);
    await box.put(cachedLoginResponse, loginResponse.toJson());
  }

  @override
  Future<LoginResponse> getCachedLogin() async {
    var box = await hiveInterface.openBox(authBoxKey);
    if(box.containsKey(cachedLoginResponse)){
      final Map<String, dynamic>? jsonString = await box.get(cachedLoginResponse);
      return Future.value(
          LoginResponse.fromJson(json.encode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}