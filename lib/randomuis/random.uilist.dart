import 'package:flutter/material.dart';
import 'package:flutter_for_people/randomuis/dynamic.bottomnavigation.dart';

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
        ],
      ),
    );
  }
}
