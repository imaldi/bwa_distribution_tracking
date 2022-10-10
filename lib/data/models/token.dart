import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';


part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token{
  //something
  @HiveType(typeId: tokenTypeId,adapterName: 'TokenAdapter')
  const factory Token({
    @HiveField(0) String? token,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json)
  => _$TokenFromJson(json);
}