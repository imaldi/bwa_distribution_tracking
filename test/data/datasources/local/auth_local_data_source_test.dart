import 'dart:convert';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([
  MockSpec<HiveInterface>(),
  MockSpec<Box<LoginResponse>>(),
])
import 'auth_local_data_source_test.mocks.dart';


void main() {
  late AuthLocalDataSourceImpl dataSource;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockHiveBox;

  setUp(() {
    final tLoginResponse =
    LoginResponse.fromJson(fixture('login_response.json'));
    mockHiveBox = MockBox();
    mockHiveInterface = MockHiveInterface();
    mockHiveInterface.openBox(authBoxKey);
    when(mockHiveInterface.openBox(authBoxKey)).thenAnswer(
            (realInvocation) async => mockHiveBox
    );
    when(mockHiveBox.containsKey(cachedLoginResponse)).thenReturn(true);
    // when(mockHiveBox.get(cachedLoginResponse)).thenAnswer(
    //         (realInvocation) async => tLoginResponse.toJson());

    dataSource = AuthLocalDataSourceImpl(authBox: mockHiveBox);
    // cacheException = MockCacheException();
  });
  group('cacheLoginResponse', () {
    final tLoginResponse =
    LoginResponse.fromJson(fixture('login_response.json'));


    test('should call put() to cache the data', () async {
      /// arrange
      /// pastikan sudah openBox
      // when(mockHiveInterface.openBox(authBoxKey)).thenAnswer(
      //         (realInvocation) async => mockHiveBox
      // );
      /// act
      await dataSource.cacheLoginResponse(tLoginResponse);
      /// assert
      verify(mockHiveBox.put(cachedLoginResponse, tLoginResponse));
    });
  });

  group('getCachedLogin', () {
    final tLoginResponse =
    LoginResponse.fromJson(fixture('login_response.json'));

    test('should return LoginResponse from Hive when there is one in the cache', () async {
      /// arrange
      /// Ketika panggil mockHiveInterface.openBox(any), return mockHiveBox
      // when(mockHiveInterface.openBox(authBoxKey)).thenAnswer(
      //         (realInvocation) async => mockHiveBox
      // );
      when(mockHiveBox.get(cachedLoginResponse))
          .thenAnswer((realInvocation) => tLoginResponse);
      /// ini untuk bypass if nya, karena belum tentu sudah put
      when(mockHiveBox.containsKey(cachedLoginResponse))
          .thenAnswer((_) => true);
          // .thenAnswer((realInvocation) async => tLoginResponse);
      /// act
      final result = await dataSource.getCachedLogin();
      /// assert
      verify(mockHiveInterface.openBox(authBoxKey));
      verify(mockHiveBox.get(cachedLoginResponse));
      expect(result, equals(tLoginResponse));
    });

    test('should throw a CacheException when there is not a cached value',(){
      /// arrange
      /// Ketika panggil mockHiveInterface.openBox(any), return mockHiveBox
      // when(mockHiveInterface.openBox(authBoxKey)).thenAnswer(
      //         (realInvocation) async => mockHiveBox
      // );
      /// ini untuk bypass if nya, karena belum tentu sudah put
      when(mockHiveBox.containsKey(cachedLoginResponse))
          .thenAnswer((_) => false);
      // .thenAnswer((realInvocation) async => tLoginResponse);
      /// act
      final call = dataSource.getCachedLogin;
      /// assert
      verify(mockHiveInterface.openBox(authBoxKey));
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });
}