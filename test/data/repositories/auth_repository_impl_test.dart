import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/auth/token.dart';
import 'package:bwa_distribution_tracking/data/models/auth/user_model.dart';
import 'package:bwa_distribution_tracking/data/repositories/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
@GenerateNiceMocks([
  MockSpec<NetworkInfo>(),
  MockSpec<AuthRemoteDataSource>(),
  MockSpec<AuthLocalDataSource>(),
])
import 'auth_repository_impl_test.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

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

  group('user login', () {
    /// DATA FOR THE MOCKS AND ASSERTIONS
    /// We'll use these three variables throughout all the tests
    // final tNumber = 1;
    const tPhone = '082233539949';
    const tPassword = 'asdfgh';
    const tUserModel = UserModel(id: 1,
        name: "Majid",
        phone: "087887789889");

    const tLoginResponse = LoginResponse(responseCode: 200,
        success: true,
        token: Token(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"),
        user: tUserModel);

    // final tNumberTriviaModel = NumberTriviaModel(number: tNumber, text:'test trivia');
    // final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    // setUp(() {
    //   when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    // });

    test('should check if the device is online', () async {
      /// arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      /// act
      await repository.login(tPhone, tPassword);

      /// assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      /// This setup only to the 'device is online' group
      setUp(() =>
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true));
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        /// arrange
        when(mockRemoteDataSource.login(tPhone, tPassword))
            .thenAnswer((_) async => tLoginResponse);

        /// act
        final result = await repository.login(tPhone, tPassword);

        /// assert
        verify(mockRemoteDataSource.login(tPhone, tPassword));
        expect(result, equals(Right(tLoginResponse)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        /// arrange
        when(mockRemoteDataSource.login(tPhone, tPassword))
            .thenAnswer((_) async => tLoginResponse);

        /// act
        await repository.login(tPhone, tPassword);

        /// assert
        verify(mockRemoteDataSource.login(tPhone, tPassword));
        verify(mockLocalDataSource.cacheLoginResponse(tLoginResponse));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        /// arrange
        when(mockRemoteDataSource.login(tPhone, tPassword))
            .thenThrow(ServerException());

        /// act
        final result = await repository.login(tPhone, tPassword);

        /// assert
        verify(mockRemoteDataSource.login(tPhone, tPassword));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() => when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => false));

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        /// arrange
        when(mockLocalDataSource.getCachedLogin())
            .thenAnswer((realInvocation) async => tLoginResponse);

        /// act
        final result = await repository.login(tPhone, tPassword);

        /// assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedLogin());
        expect(result, equals(Right(tLoginResponse)));
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        /// arrange
        when(mockLocalDataSource.getCachedLogin()).thenThrow(CacheException());

        /// act
        final result = await repository.login(tPhone, tPassword);

        /// assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedLogin());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
