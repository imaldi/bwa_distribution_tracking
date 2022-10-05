library user_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:bwa_distribution_tracking/domain/entities/user_entity.dart';
import '../../core/resources/serializers/serializers.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: userTypeId)
abstract class UserModel
    implements UserEntity, Built<UserModel, UserModelBuilder> {
  // class field here
  // @BuiltValueField(wireName: 'a_field')
  @HiveField(0)
  @override
  int? get id;

  @HiveField(1)
  @override
  String? get name;

  @HiveField(2)
  @override
  String? get phone;

  // @override
  // int? get typeId;

  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  // static void _initializeBuilder(UserModelBuilder builder) => builder
  //   ..typeId = 0
  // ;

  Map<String, dynamic> toJson() {
    return jsonDecode(
        jsonEncode(serializers.serializeWith(UserModel.serializer, this)));
  }

  static UserModel fromJson(String jsonString) =>
      serializers.deserializeWith(
          UserModel.serializer, json.decode(jsonString)) ??
      UserModel();

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
