class ServerException implements Exception {
  final String? message;
  const ServerException({this.message});
}

class DataNotFoundException implements Exception {}

class CacheException implements Exception {}
