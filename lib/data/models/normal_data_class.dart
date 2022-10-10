import 'package:bwa_distribution_tracking/core/resources/consts/hive_type_id.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'normal_data_class.g.dart';

@HiveType(typeId: normalDataClassTypeId)
class NormalDataClass extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;
  NormalDataClass({
    required this.name,
    required this.country,
  });

  @override
  List<Object?> get props => [
    name,
    country,
  ];
}
