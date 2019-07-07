import 'package:flutter/material.dart';

class GraphExample extends StatefulWidget {
  @override
  _GraphExampleState createState() => _GraphExampleState();
}

class _GraphExampleState extends State<GraphExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
