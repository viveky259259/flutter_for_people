import 'package:flutter/material.dart';

void main() => runApp(UIGenerationMainApp());

class UIGenerationMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hi",
      home: UIGeneration(),
    );
  }
}

class UIGeneration extends StatefulWidget {
  @override
  _UIGenerationState createState() => _UIGenerationState();
}

class _UIGenerationState extends State<UIGeneration> {
  Map<String, String> demo = {
    "text": "generateCode",
  };

  List<Widget> getUiFromCode(Map<String, String> demo) {
    List<Widget> widgets = [];
    if (demo.containsKey("text")) widgets.add(Text(demo["text"]));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code generation"),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          List<Widget> body = getUiFromCode(demo);
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return body[index];
            },
            itemCount: body.length,
          );
        },
      ),
    );
  }
}
