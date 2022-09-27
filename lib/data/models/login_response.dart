// library login_response;
//
// import 'dart:convert';
//
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import '../../data/models/user_model.dart';
// import '../../serializers/serializers.dart';
//
// part 'login_response.g.dart';
//
// abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {
//   // class field here
//   // @BuiltValueField(wireName: 'a_field')
//   // String? get aField;
//   @override
//   String get name {
//     return super.name;
//   }
//   int get id {
//     return super.id;
//   }
//
//   LoginResponse._();
//
//   factory LoginResponse([Function(LoginResponseBuilder b) updates]) = _$LoginResponse;
//
//   // static void _initializeBuilder(LoginResponseBuilder builder) => builder
//   //   ..isLoading = false
//   //   ..isFailed = false
//   // ;
//   // Map<String, dynamic> toJson() {
//   //   return jsonDecode(jsonEncode(serializers.serializeWith(LoginResponse.serializer, this)));
//   // }
//   //
//   // static LoginResponse fromJson(String jsonString) {
//   //   return serializers.deserializeWith(LoginResponse.serializer, json.decode(jsonString)) ??
//   //       LoginResponse();
//   // }
//   //
//   // static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
// }