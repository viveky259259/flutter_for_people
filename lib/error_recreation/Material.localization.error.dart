import 'package:flutter/material.dart';

/*
Stack overlow URL : https://stackoverflow.com/questions/56275595/no-materiallocalizations-found-myapp-widgets-require-materiallocalizations-to

  Errorneous Code

 import 'package:flutter/material.dart';

class MaterialLocalizationError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: Scaffold(
        appBar: AppBar(title: Text("Test")),
        body: Container(
          child: Center(
            child: RaisedButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                testAlert(context);
              },
              child: Text("PressMe"),
            ),
          ),
        ),
      ),
    );
  }

  void testAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Test"),
      content: Text("Done..!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
*/

//Corrected Code

class MaterialLocalizationError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Test", home: Test());
  }
}

class Test extends StatelessWidget {
  void testAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Test"),
      content: Text("Done..!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            onPressed: () {
              testAlert(context);
            },
            child: Text("PressMe"),
          ),
        ),
      ),
    );
  }
}
