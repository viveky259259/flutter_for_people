import 'package:hive/hive.dart';

part 'hive.model.g.dart';

@HiveType()
class HiveModel {
  @HiveField(0)
  final String dataValue;
  @HiveField(1)
  final String dataKey;

  HiveModel(this.dataValue, this.dataKey);
}
