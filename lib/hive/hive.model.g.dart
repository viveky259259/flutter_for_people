// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelAdapter extends TypeAdapter<HiveModel> {
  @override
  final typeId = 2;

  @override
  HiveModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dataValue)
      ..writeByte(1)
      ..write(obj.dataKey);
  }
}
