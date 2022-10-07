import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model_freezed_hive.freezed.dart';
part 'user_model_freezed_hive.g.dart';

@freezed
class UserModelFreezedHive with _$UserModelFreezedHive{
    const factory UserModelFreezedHive({
      required String firstName,
      required String lastName,
      required int age,
    }) = _UserModelFreezedHive;

    factory UserModelFreezedHive.fromJson(Map<String, Object?> json)
    => _$UserModelFreezedHiveFromJson(json);
}