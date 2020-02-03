import 'package:flutter/material.dart';
import 'package:flutter_for_people/theory/lifecycle.dart';

class TheoryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Theory list")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("LifeCycle"),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LifeCycleExample()));
            },
          ),
        ],
      ),
    );
  }
}
