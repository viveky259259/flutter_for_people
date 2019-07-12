import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class ArkitTest extends StatefulWidget {
  @override
  _ArkitTestState createState() => _ArkitTestState();
}

class _ArkitTestState extends State<ArkitTest> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arkit test"),
      ),
      body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
    );
  }
}
