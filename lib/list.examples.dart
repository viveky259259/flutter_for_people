import 'package:flutter/material.dart';
import 'package:flutter_for_people/animation/physics.animation.example.dart';
import 'package:flutter_for_people/databases/sqlcool/main.dart' as SQLCool;
import 'package:flutter_for_people/error_recreation/error.recreation.list.dart';
import 'package:flutter_for_people/http_.dart';
import 'package:flutter_for_people/modal_bottom_sheet.dart';
import 'package:flutter_for_people/randomuis/random.uilist.dart';
import 'package:flutter_for_people/theory/theory_list.dart';
import 'package:flutter_for_people/widgets/widget.examples.dart';

class ExamplesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Examples'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Theory"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TheoryExample()));
            },
          ),
          ListTile(
            title: Text("Random Uis"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RandomUis()));
            },
          ),
          ListTile(
            title: Text("Errors"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Errors()));
            },
          ),
          ListTile(
            title: Text("Databases"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SQLCool.MyApp()));
            },
          ),
          ListTile(
            title: Text("Widgets"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WidgetList()));
            },
          ),
          ListTile(
            title: Text('Image Picker'),
            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => ImagePickerExample()));
            },
          ),
          ListTile(
            title: Text('Multi Image Picker'),
            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => MultiImagePickerExample()));
            },
          ),
          ListTile(
            title: Text('Physics Animation '),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PhysicsAnimationExample()));
            },
          ),
          ListTile(
            title: Text('Http Example'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HttpExample()));
            },
          ),
          ListTile(
            title: Text('Modal Bottom Sheet'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ModalBottomSheetExample()));
            },
          ),
        ],
      ),
    );
  }
}
