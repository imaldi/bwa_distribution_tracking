import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  // TODO change after test
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool>? get isConnected => connectionChecker.hasConnection;
}