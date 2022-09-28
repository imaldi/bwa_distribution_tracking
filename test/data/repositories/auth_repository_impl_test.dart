
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource{}
class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  AuthRepositoryImpl repository;
  MockAuthRemoteDataSource mockRemoteDataSource;
  MockAuthLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      authRemoteDataSource: mockRemoteDataSource,
      authLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

}