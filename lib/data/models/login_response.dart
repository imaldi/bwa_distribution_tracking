library login_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:bwa_distribution_tracking/data/models/token.dart';
import '../../data/models/user_model.dart';
import '../../core/resources/serializers/serializers.dart';
import 'package:hive/hive.dart';

part 'login_response.g.dart';

@HiveType(typeId: loginResponseTypeId)
abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  // class field here
  // String? get aField;
  @HiveField(0)
  @BuiltValueField(wireName: '0')
  int? get responseCode;

  @HiveField(1)
  bool? get success;

  @HiveField(2)
  Token? get token;

  @HiveField(3)
  UserModel? get user;

  LoginResponse._();

  factory LoginResponse([Function(LoginResponseBuilder b) updates]) =
      _$LoginResponse;

  // static void _initializeBuilder(LoginResponseBuilder builder) => builder
  //   ..isLoading = false
  //   ..isFailed = false
  // ;

  Map<String, dynamic> toJson() {
    return jsonDecode(
        jsonEncode(serializers.serializeWith(LoginResponse.serializer, this)));
  }

  static LoginResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
            LoginResponse.serializer, json.decode(jsonString)) ??
        LoginResponse();
  }

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}

// @HiveType(typeId: tokenTypeId)
// abstract class Token implements Built<Token, TokenBuilder> {
//   // class field here
//   // @BuiltValueField(wireName: 'a_field')
//   @HiveField(0)
//   String? get token;
//
//   Token._();
//
//   factory Token([Function(TokenBuilder b) updates]) = _$Token;
//
//   Map<String, dynamic> toJson() {
//     return jsonDecode(
//         jsonEncode(serializers.serializeWith(Token.serializer, this)));
//   }
//
//   static Token fromJson(String jsonString) {
//     return serializers.deserializeWith(
//             Token.serializer, json.decode(jsonString)) ??
//         Token();
//   }
//
//   static Serializer<Token> get serializer => _$tokenSerializer;
// }
