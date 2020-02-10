import 'package:flutter/material.dart';
import 'package:sqlcool/sqlcool.dart';

Future<void> initDb(@required Db db,
    {String path = "items.sqlite", bool absPath = false}) async {
  final user = DbTable("user")
    ..varchar("name");

  final message = DbTable("message")

    ..integer("sender_id")
    ..integer("receiver_id")
    ..text("message");
  final populateQueries = <String>[
    'Insert into user(id,name) Values (0,"Vivek")',
    'Insert into user(id,name) Values (1,"Amit")',
    'Insert into user(id,name) Values (2,"Prikesh")',
    'Insert into message(id,sender_id,receiver_id,message) Values (0,0,1,"hey wassup")',
    'Insert into message(id,sender_id,receiver_id,message) Values (1,1,0,"hey ")',
    'Insert into message(id,sender_id,receiver_id,message) Values (2,0,1,"kya kr rha h")',
    'Insert into message(id,sender_id,receiver_id,message) Values (3,1,0,"nothing")',
  ];
  await db
      .init(
          path: path,
          schema: [user, message],
          queries: populateQueries,
          absolutePath: absPath,
          verbose: true)
      .catchError((e) {
    throw ("Error initializing the database: ${e.message}");
  });
  print("Data base initialized");
  db.schema.describe();
}
