import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/urls.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([
  MockSpec<http.Client>(),
])
import 'auth_remote_data_source_test.mocks.dart';

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('login_response.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getConcreteAuth', () {
    const tPhone = '082233539949';
    const tPassword = 'asdfgh';
    final tUserModel = UserModel().rebuild((p0) => p0
      ..id = 1
      ..name = "Majid"
      ..phone = "087887789889");

    final tLoginResponse = LoginResponse().rebuild((p0) => p0
      ..responseCode = 200
      ..success = true
      ..token =
          Token((p0) => p0..token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9")
              .toBuilder()
      ..user = tUserModel.toBuilder());

    test(
        'should perform a GET request on an URL with number being the endpoint and with application/json header',
        () {
      /// arrange
      setUpMockHttpClientSuccess200();

      /// act
      dataSource.login(tPhone, tPassword);

      /// assert
      verify(mockHttpClient.get(Uri(path: baseUrl + loginUrl), headers: {
        'Content-Type': 'application/json',
      }));
    });

    // final tAuthModel =
    // AuthModel.fromJson(json.decode(fixture('login_response.json')));
    //
    test('should return Auth when the response code is 200 (success)',
        () async {
      /// arrange
      setUpMockHttpClientSuccess200();

      /// act
      final result = await dataSource.login(tPhone, tPassword);

      /// assert
      expect(result, equals(tLoginResponse));
    });
    //
    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      /// arrange
      setUpMockHttpClientFailure404();

      /// act
      final call = dataSource.login;

      /// assert
      expect(() => call(tPhone, tPassword),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });

  // group('getRandomAuth', () {
  //   final tAuthModel =
  //   AuthModel.fromJson(json.decode(fixture('login_response.json')));
  //
  //   test(
  //     'should preform a GET request on a URL with *random* endpoint with application/json header',
  //         () {
  //       //arrange
  //       setUpMockHttpClientSuccess200();
  //       // act
  //       dataSource.getRandomAuth();
  //       // assert
  //       verify(mockHttpClient.get(
  //         Uri(path: 'http://numbersapi.com/random'),
  //         headers: {'Content-Type': 'application/json'},
  //       ));
  //     },
  //   );
  //
  //   test(
  //     'should return Auth when the response code is 200 (success)',
  //         () async {
  //       // arrange
  //       setUpMockHttpClientSuccess200();
  //       // act
  //       final result = await dataSource.getRandomAuth();
  //       // assert
  //       expect(result, equals(tAuthModel));
  //     },
  //   );
  //
  //   test(
  //     'should throw a ServerException when the response code is 404 or other',
  //         () async {
  //       // arrange
  //       setUpMockHttpClientFailure404();
  //       // act
  //       final call = dataSource.getRandomAuth;
  //       // assert
  //       expect(() => call(), throwsA(TypeMatcher<ServerException>()));
  //     },
  //   );
  // });
}
