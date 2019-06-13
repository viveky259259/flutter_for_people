import 'package:flutter/material.dart';

class ModalBottomSheetExample extends StatefulWidget {
  @override
  _ModalBottomSheetExampleState createState() =>
      _ModalBottomSheetExampleState();
}

class _ModalBottomSheetExampleState extends State<ModalBottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("MODAL BOTTOM SHEET EXAMPLE"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.photo),
                      title: new Text('Photo'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.music_note),
                      title: new Text('Music'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.videocam),
                      title: new Text('Video'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.open_with),
      ),
    );
  }
}
