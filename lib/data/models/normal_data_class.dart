import 'package:hive/hive.dart';

part 'normal_data_class.g.dart';

@HiveType(typeId: 4)
class NormalDataClass {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;
  NormalDataClass({
    required this.name,
    required this.country,
  });
}
