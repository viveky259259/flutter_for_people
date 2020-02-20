import 'package:flutter/material.dart';
import 'package:flutter_for_people/randomuis/dynamic.bottomnavigation.dart';
import 'package:flutter_for_people/randomuis/simplerungame.dart';
import 'package:flutter_for_people/randomuis/sketch.dart';
import 'package:flutter_for_people/randomuis/solido.example.dart';

class RandomUis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random UI list")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Dynamic bottom navigation"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DynamicBottomNavigationBarExample()));
            },
          ),
          ListTile(
            title: Text("Sketch"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SketchPage()));
            },
          ),
          ListTile(
            title: Text("Running game"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RunHomePage()));
            },
          ),
          ListTile(
            title: Text("Solido Example No Widget"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SolidoExampleNoWidget()));
            },
          ),
        ],
      ),
    );
  }
}
