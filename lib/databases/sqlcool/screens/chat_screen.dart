import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_for_people/databases/sqlcool/conf.dart';

class ChatScreen extends StatefulWidget {
  final int userId;
  final int secondUserId;

  ChatScreen(this.userId, this.secondUserId);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _streamController = StreamController<List<Map<String, dynamic>>>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initChat();
  }

  initChat() async {
    db
        .select(
            table: "message",
            where:
                "sender_id=${widget.userId} & receiver_id=${widget.secondUserId}")
        .asStream()
        .listen((data) {
      print(data);
      _streamController.add(data);
    });
    db.changefeed.listen((change) {
      db
          .select(
              table: "message",
              where:
                  "sender_id=${widget.userId} & receiver_id=${widget.secondUserId}")
          .asStream()
          .listen((data) {
        print(data);
        _streamController.add(data);
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: _streamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data[snapshot.data.length-index-1]["message"]),
                      );
                    });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ListTile(
        onTap: () {
          db.insert(table: "message", row: {
            "message": "New message ${DateTime.now().millisecondsSinceEpoch}",
            "sender_id": widget.userId.toString(),
            "receiver_id": widget.secondUserId.toString()
          });
        },
        title: Text("Enter some thing"),
      ),
    );
  }
}
