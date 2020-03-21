import 'package:bloc/bloc.dart';
import 'package:flutter_for_people/hive/event/hive.event.dart';
import 'package:flutter_for_people/hive/repository/hive.repository.dart';
import 'package:flutter_for_people/hive/state/hive.state.dart';
import 'package:hive/hive.dart';

import '../hive.model.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  final HiveRepository hiveRepository;

  HiveBloc(this.hiveRepository) : super() {
    Hive.registerAdapter(HiveModelAdapter());
  }

  @override
  HiveState get initialState => InitState();

  @override
  Stream<HiveState> mapEventToState(HiveEvent event) async* {
    if (event is WriteEvent) {
      yield WritingState();

      await hiveRepository.addModel(event.hiveModel);
      yield WriteCompleteState();
      dispatch(ReadEvent());
    } else if (event is ReadEvent) {
      yield ReadingState();
      Map<dynamic, dynamic> a = hiveRepository.getModels();
      List<HiveModel> list = List();
      for (int i = 0; i < a.length; i++) {
        list.add(HiveModel(a["dataValue"], a["dataKey"]));
      }
      yield ReadCompleteState(list);
    } else if (event is DeleteEvent) {
      yield DeletingState();
      hiveRepository.deleteAll();
      yield DeleteCompleteState();
    }
  }
}
