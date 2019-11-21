import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_for_people/hive/newexample/person.model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveExampleUi extends StatefulWidget {
  @override
  _HiveExampleUiState createState() => _HiveExampleUiState();
}

class _HiveExampleUiState extends State<HiveExampleUi> {
  Box _personBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.registerAdapter(PersonModelAdapter(), 0);
    _openBox();
  }

  Future _openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _personBox = await Hive.openBox('personBox');
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive example"),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              FlatButton(
                child: Text("Add item "),
                onPressed: () {
                  PersonModel personModel = PersonModel(
                      Random().nextInt(100),
                      ""
                      "Vivek",
                      DateTime.now());
                  _personBox.add(personModel);
                },
              ),
              FlatButton(
                child: Text("Delete item "),
                onPressed: () {
                  int lastIndex = _personBox.toMap().length - 1;
                  if (lastIndex >= 0) _personBox.deleteAt(lastIndex);
                },
              ),
              FlatButton(
                child: Text("Update item "),
                onPressed: () {
                  int lastIndex = _personBox.toMap().length - 1;
                  if (lastIndex < 0) return;

                  PersonModel personModel =
                      _personBox.values.toList()[lastIndex];
                  personModel.birthDate = DateTime.now();
                  _personBox.putAt(lastIndex, personModel);
                },
              ),
            ],
          ),
          Text("Data in database"),
          _personBox == null
              ? Text("Box is not initialized")
              : Expanded(
                  child: WatchBoxBuilder(
                    box: _personBox,
                    builder: (context, box) {
                      Map<dynamic, dynamic> raw = box.toMap();
                      List list = raw.values.toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          PersonModel personModel = list[index];
                          return ListTile(
                            title: Text(personModel.name),
                            leading: Text(personModel.id.toString()),
                            subtitle: Text(
                                personModel.birthDate.toLocal().toString()),
                          );
                        },
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
