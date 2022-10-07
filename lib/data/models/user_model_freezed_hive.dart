import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'user_model_freezed_hive.freezed.dart';
part 'user_model_freezed_hive.g.dart';

@freezed
class UserModelFreezedHive with _$UserModelFreezedHive{

  @HiveType(typeId: userTypeId,adapterName: 'UserModelFreezedHiveAdapter')
  const factory UserModelFreezedHive({
    @HiveField(0)String? firstName,
    @HiveField(1) String? lastName,
    @HiveField(2) int? age,
    }) = _UserModelFreezedHive;

    factory UserModelFreezedHive.fromJson(Map<String, Object?> json)
    => _$UserModelFreezedHiveFromJson(json);
}