import 'dart:convert';

import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.bv.dart';
import 'package:bwa_distribution_tracking/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel().rebuild((p0) => p0
    ..id = 1
    ..name = "Majid"
    ..phone = "087887789889");

  test('should be a subclass of UserEntity', () async {
    /// assert
    expect(tUserModel, isA<UserEntity>());
  });

  group('fromJson', () {
    test('should return a valid model when retrieving the json response',
        () async {
      /// arrange
      final Map<String, dynamic> responseJsonMap =
          json.decode(fixture('login_response.json'));
      final responseModel = LoginResponse.fromJson(jsonEncode(responseJsonMap));

      /// act
      final result = responseModel.user;
      // final result = UserModel.fromJson(jsonEncode(jsonMap));

      /// assert
      expect(result, tUserModel);
    });

    // test('should return a valid model when the JSON number is regarded as a double', () async {
    //   /// arrange
    //   final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
    //   /// act
    //   final result = NumberTriviaModel.fromJson(jsonMap);
    //   /// assert
    //   expect(result, tNumberTriviaModel);
    // }
    // );
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      /// act
      final result = tUserModel.toJson();

      /// assert
      final expectedJsonMap = {
        'id': 1,
        'name': 'Majid',
        "phone": "087887789889",
      };

      expect(result, expectedJsonMap);
    });
  });
}
