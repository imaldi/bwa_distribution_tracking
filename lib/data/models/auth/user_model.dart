import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  //something
  @HiveType(typeId: userTypeId,adapterName: 'UserModelAdapter')
  const factory UserModel({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? phone,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
  => _$UserModelFromJson(json);
}