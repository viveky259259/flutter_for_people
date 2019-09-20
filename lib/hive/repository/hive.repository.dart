import 'package:flutter_for_people/hive/hive.model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepository {
  HiveRepository() : super() {
    _openBox();
  }

  Box box;

  Future _openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('myBox');
    return;
  }

  Future<int> addModel(HiveModel hiveModel) async {
    int a = await box.add(hiveModel);
    return a;
  }

  Map<dynamic, dynamic> getModels() {
    Map<dynamic, dynamic> a = box.toMap();

    return a;
  }

  deleteAll() {
    box.clear();
    return;
  }
}
