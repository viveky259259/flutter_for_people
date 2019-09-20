import 'package:equatable/equatable.dart';
import 'package:flutter_for_people/hive/hive.model.dart';

class HiveEvent extends Equatable {
  HiveEvent([List props = const []]) : super(props);
}

class WriteEvent extends HiveEvent {
  final HiveModel hiveModel;

  WriteEvent(this.hiveModel);

  @override
  String toString() {
    return "WriteEvent";
  }
}

class ReadEvent extends HiveEvent {
  @override
  String toString() {
    return "ReadEvent";
  }
}

class DeleteEvent extends HiveEvent {
  @override
  String toString() {
    return "DeleteEvent";
  }
}

class UpdateEvent extends HiveEvent {
  @override
  String toString() {
    return "UpdateEvent";
  }
}
