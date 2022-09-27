library login_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../../data/models/user_model.dart';
import '../../core/resources/serializers/serializers.dart';

part 'login_response.g.dart';

abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {
  // class field here
  // String? get aField;
  @BuiltValueField(wireName: '0')
  int? get responseCode;
  bool? get success;
  Token? get token;
  UserModel? get user;

  LoginResponse._();

  factory LoginResponse([Function(LoginResponseBuilder b) updates]) = _$LoginResponse;

  // static void _initializeBuilder(LoginResponseBuilder builder) => builder
  //   ..isLoading = false
  //   ..isFailed = false
  // ;
  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(LoginResponse.serializer, this)));
  }

  static LoginResponse fromJson(String jsonString) {
    return serializers.deserializeWith(LoginResponse.serializer, json.decode(jsonString)) ??
        LoginResponse();
  }

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}

abstract class Token implements Built<Token, TokenBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  String? get token;

  Token._();

  factory Token([Function(TokenBuilder b) updates]) = _$Token;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(Token.serializer, this)));
  }

  static Token fromJson(String jsonString) {
    return serializers.deserializeWith(Token.serializer, json.decode(jsonString)) ??
        Token();
  }

  static Serializer<Token> get serializer => _$tokenSerializer;
}