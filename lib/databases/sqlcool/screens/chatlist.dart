import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_for_people/databases/sqlcool/screens/chat_screen.dart';

import '../conf.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final _streamController = StreamController<List<Map<String, dynamic>>>();
  bool isDatabaseReady = false;

  @override
  void initState() {
    super.initState();
    startDb();
  }

  startDb() async {
    await db.onReady;
    setState(() {
      isDatabaseReady = true;
    });
    print("ready");
    db
        .join(
            table: "user",
            columns: "user.name,user.id as id,message.receiver_id as second_id",
            joinTable: "message",
            joinOn: "user.id=message.sender_id",
            groupBy: "user.name")
        .then((data) {
      _streamController.add(data);
    });

  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: isDatabaseReady
          ? StreamBuilder(
              stream: _streamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = snapshot.data[index];
                      return ListTile(
                        onTap: () {
                          int id = item["id"];
                          int secondId = item["second_id"];
                          print(item);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatScreen(id, secondId)));
                        },
                        title: Text("${item["name"]}"),
//                  subtitle: Text("${item["category_name"]}"),
//                  trailing: (item["price"] != null)
//                      ? Text("${item["price"]}")
//                      : const Text(""),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
