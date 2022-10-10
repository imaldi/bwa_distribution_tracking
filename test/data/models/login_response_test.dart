import 'dart:convert';

import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/auth/token.dart';
import 'package:bwa_distribution_tracking/data/models/auth/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(id: 1,
    name: "Majid",
    phone: "087887789889");

  const tLoginResponse = LoginResponse(responseCode: 200,
    success: true,
    token: Token(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"),
    user: tUserModel);

  group('fromJson', () {
    test('should return a valid model when retrieving the json response',
        () async {
      /// arrange
      final Map<String, dynamic> responseJsonMap =
          json.decode(fixture('login_response.json'));

      /// act
      final responseModel = LoginResponse.fromJson(responseJsonMap);
      // final result = responseModel.user;
      // final result = UserModel.fromJson(jsonEncode(jsonMap));

      /// assert
      expect(responseModel, tLoginResponse);
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
      final result = tLoginResponse.toJson();

      /// assert
      final expectedJsonMap = {
        "0": 200,
        "success": true,
        "token": {"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"},
        "user": {
          'id': 1,
          'name': 'Majid',
          "phone": "087887789889",
        }
      };

      expect(result, expectedJsonMap);
    });
  });
}
