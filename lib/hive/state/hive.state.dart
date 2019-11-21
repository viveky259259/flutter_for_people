import 'package:equatable/equatable.dart';
import 'package:flutter_for_people/hive/hive.model.dart';

class HiveState extends Equatable {
  HiveState([List props = const []]);

  @override
  List<Object> get props => null;
}

class InitState extends HiveState {
  @override
  String toString() {
    return "InitState";
  }
}

class WritingState extends HiveState {
  @override
  String toString() {
    return "WritingState";
  }
}

class WriteCompleteState extends HiveState {
  @override
  String toString() {
    return "WriteCompleteState";
  }
}

class ReadingState extends HiveState {
  @override
  String toString() {
    return "ReadingState";
  }
}

class ReadCompleteState extends HiveState {
  List<HiveModel> models;

  ReadCompleteState(this.models);
  @override
  String toString() {
    return "ReadCompleteState";
  }
}

class DeletingState extends HiveState {
  @override
  String toString() {
    return "DeletingState";
  }
}

class DeleteCompleteState extends HiveState {
  @override
  String toString() {
    return "DeleteCompleteState";
  }
}

class UpdatingState extends HiveState {
  @override
  String toString() {
    return "UpadtingState";
  }
}

class UpdateCompleteState extends HiveState {
  @override
  String toString() {
    return "UpdateCompleteState";
  }
}
