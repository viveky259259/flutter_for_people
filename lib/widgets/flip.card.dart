import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardExample extends StatefulWidget {
  @override
  _FlipCardExampleState createState() => _FlipCardExampleState();
}

class _FlipCardExampleState extends State<FlipCardExample> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          front: Center(
            child: Container(
              height: 200,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () => cardKey.currentState.toggleCard(),
                child: Text('front'),
              ),
            ),
          ),
          back: Center(
            child: Container(
              height: 100,
              width: 100,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () => cardKey.currentState.toggleCard(),
                child: Text('back'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
