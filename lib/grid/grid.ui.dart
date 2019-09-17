import 'package:flutter/material.dart';

class GridUi extends StatefulWidget {
  @override
  _GridUiState createState() => _GridUiState();
}

class _GridUiState extends State<GridUi> {
  List<GridModel> models = [
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
    GridModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Test"),
      ),
      body: Column(
        children: <Widget>[
          Text("Test kr"),
          Expanded(
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List<Widget>.generate(models.length, (index) {
                  return GridWidget(models[index], index);
                })),
          ),
        ],
      ),
    );
  }
}

class GridModel {
  bool isSelected = false;
}

class GridWidget extends StatefulWidget {
  final GridModel model;
  final int index;

  GridWidget(this.model, this.index);

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.model.isSelected = !widget.model.isSelected;
        setState(() {});
      },
      child: Card(
        margin: EdgeInsets.all(0),
        child: Container(
          color: widget.model.isSelected ? Colors.green : Colors.red,
          child: Text(widget.model.isSelected
              ? "Selected ${widget.index}"
              : "Not "
                  "selected  ${widget.index}"),
        ),
      ),
    );
  }
}
