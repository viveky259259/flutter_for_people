import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_people/databases/sqlcool/conf.dart';
import 'package:flutter_for_people/databases/sqlcool/initdb.dart';
import 'package:flutter_for_people/databases/sqlcool/screens/chatlist.dart';

void main() {
  runApp(MyApp());
}

final routes = {
  '/': (BuildContext context) => ChatList(),
//  '/select_bloc': (BuildContext context) => PageSelectBloc(),
//  '/join': (BuildContext context) => PageJoinQuery(),
//  '/upsert': (BuildContext context) => UpsertPage(),
//  '/dbmodel': (BuildContext context) => DbModelPage(),
//  '/dbmanager': (BuildContext context) => DbViewer(db: db),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initDb(db);
    return MaterialApp(
      title: "Sql cool",
      routes: routes,
    );
  }
}
