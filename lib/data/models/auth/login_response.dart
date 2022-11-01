library login_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:bwa_distribution_tracking/data/models/auth/token.dart';
import 'user_model.dart';
import 'package:hive/hive.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse{
  // refresh for adapter with changing comments
  @HiveType(typeId: loginResponseTypeId,adapterName: 'LoginResponseAdapter')
  @JsonSerializable(explicitToJson: true)
  const factory LoginResponse({
    @JsonKey(name: '0')
    @HiveField(0)
    int? responseCode,

    @HiveField(1)
    bool? success,

    @HiveField(2)
    Token? token,

    @HiveField(3)
    UserModel? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json)
  => _$LoginResponseFromJson(json);
}




// @HiveType(typeId: loginResponseTypeId)
// abstract class LoginResponse
//     implements Built<LoginResponse, LoginResponseBuilder> {
//   // class field here
//   // String? get aField;
//   @HiveField(0)
//   @BuiltValueField(wireName: '0')
//   int? get responseCode;
//
//   @HiveField(1)
//   bool? get success;
//
//   @HiveField(2)
//   Token? get token;
//
//   @HiveField(3)
//   UserModel? get user;
//
//   LoginResponse._();
//
//   factory LoginResponse([Function(LoginResponseBuilder b) updates]) =
//       _$LoginResponse;
//
//   // static void _initializeBuilder(LoginResponseBuilder builder) => builder
//   //   ..isLoading = false
//   //   ..isFailed = false
//   // ;
//
//   Map<String, dynamic> toJson() {
//     return jsonDecode(
//         jsonEncode(serializers.serializeWith(LoginResponse.serializer, this)));
//   }
//
//   static LoginResponse fromJson(String jsonString) {
//     return serializers.deserializeWith(
//             LoginResponse.serializer, json.decode(jsonString)) ??
//         LoginResponse();
//   }
//
//   static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
// }
