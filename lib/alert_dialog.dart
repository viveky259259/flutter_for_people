import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertDialogExample extends StatefulWidget {
  @override
  _AlertDialogExampleState createState() => _AlertDialogExampleState();
}

class _AlertDialogExampleState extends State<AlertDialogExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("DIALOG EXAMPLE"),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Alert dialog(Android"),
                  onPressed: (){
                    showDialog(
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
                ),
                RaisedButton(
                  child: Text("Cupertino dialog(iOS"),
                  onPressed: (){
                    showDialog(
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
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Click me"),
        onPressed: () {


          showCupertinoDialog( context: context,
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: Container(
                      height: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ),
                  ),
                );
              });
        },
        icon: Icon(Icons.open_with),
      ),
    );
  }
}
