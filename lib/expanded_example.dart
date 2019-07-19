import 'package:flutter/material.dart';

class ExpandedExample extends StatefulWidget {
  @override
  _ExpandedExampleState createState() => _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              ),
            )
          ],
        ),
      )),
    );
  }
}
