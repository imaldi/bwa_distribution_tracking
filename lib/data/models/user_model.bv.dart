library user_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bwa_distribution_tracking/domain/entities/user_entity.dart';
import '../../core/resources/serializers/serializers.bv.dart';

part 'user_model.bv.g.dart';

abstract class UserModel implements UserEntity, Built<UserModel, UserModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  @override
  int? get id;

  @override
  String? get name;

  @override
  String? get phone;




  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(serializers.serializeWith(UserModel.serializer, this)));
  }

  static UserModel fromJson(String jsonString) {
    return serializers.deserializeWith(UserModel.serializer, json.decode(jsonString)) ??
        UserModel();
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}