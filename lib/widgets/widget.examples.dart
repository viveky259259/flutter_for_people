import 'package:flutter/material.dart';
import 'package:flutter_for_people/widgets/flip.card.dart';
import 'package:flutter_for_people/widgets/listviews.dart';
import 'package:flutter_for_people/widgets/table.example.dart';
import 'package:flutter_for_people/widgets/text.view.dart';

class WidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Examples'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('FlipCard'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FlipCardExample()));
            },
          ),
          ListTile(
            title: Text('Listview'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListViewExample()));
            },
          ),
          ListTile(
            title: Text('Table'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TableExample()));
            },
          ),
          ListTile(
            title: Text('Text'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TextExample()));
            },
          ),
        ],
      ),
    );
  }
}
