import 'package:flutter/material.dart';
import 'package:flutter_for_people/error_recreation/Material.localization.error.dart';
import 'package:flutter_for_people/randomuis/dynamic.bottomnavigation.dart';

class Errors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Recreation list")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("MaterialLocalization"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MaterialLocalizationError()));
            },
          ),
        ],
      ),
    );
  }
}
