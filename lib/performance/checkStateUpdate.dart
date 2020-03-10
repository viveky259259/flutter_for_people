import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(toString());
    return MaterialApp(
      title: "Performance",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Performance"),
        ),
        body: TestTouchUpdate(),
      ),
    );
  }
}

class TestTouchUpdate extends StatefulWidget {
  @override
  _TestTouchUpdateState createState() => _TestTouchUpdateState();
}

class _TestTouchUpdateState extends State<TestTouchUpdate> {
  @override
  Widget build(BuildContext context) {
    print(toString());
    return AnimatedContainer(
      width: 100,
      duration: Duration(seconds: 10),
      child: Butt(),
    );
  }
}

class Butt extends StatefulWidget {
  @override
  _ButtState createState() => _ButtState();
}

class _ButtState extends State<Butt> {
  @override
  Widget build(BuildContext context) {
    print(toString());

    var text = "Hello";
    double width = 500;
    return RaisedButton(
      onPressed: () {
        setState(() {
          width = 100;
          text = "Hell";
        });
      },
      child: Text(text),
    );
  }
}
