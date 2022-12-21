import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  // something
  @HiveType(typeId: userTypeId,adapterName: 'UserModelAdapter')
  const factory UserModel({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? phone,
    @HiveField(3) String? foto, // ayolah oi
    @HiveField(4) String? role,
    @HiveField(5) String? ttd,
    @JsonKey(name: "api_token") @HiveField(6) String? apiToken,
    @JsonKey(name: "created_at") @HiveField(7) String? createdAt,
    @JsonKey(name: "updated_at") @HiveField(8) String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
  => _$UserModelFromJson(json);
}