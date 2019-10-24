import 'package:flutter/material.dart';

class TableExample extends StatefulWidget {
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
          border: TableBorder.all(
              color: Colors.black26, width: 1, style: BorderStyle.none),
          children: [
            TableRow(children: [
              TableCell(child: Center(child: Text('Title'))),
              TableCell(
                child: Center(child: Text('Title')),
              ),
              TableCell(child: Center(child: Text('Title'))),
              TableCell(child: Center(child: Text('Title'))),
            ]),
            TableRow(children: [
              TableCell(
                child: Center(child: Text('Value')),
                verticalAlignment: TableCellVerticalAlignment.bottom,
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(child: Text('Value')),
              ),
              TableCell(
                  child: Center(
                      child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ValueaaValueaaValueaaValueaaValueaaValueaaValueaa',
                  style: TextStyle(color: Colors.yellow),
                ),
              ))),
              TableCell(
                child: Center(child: Text('Value')),
                verticalAlignment: TableCellVerticalAlignment.top,
              ),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Value'))),
              TableCell(
                child: Center(child: Text('Value')),
              ),
              TableCell(child: Center(child: Text('Value'))),
              TableCell(child: Center(child: Text('Value'))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Value'))),
              TableCell(
                child: Center(child: Text('Value')),
              ),
              TableCell(child: Center(child: Text('Value'))),
              TableCell(child: Center(child: Text('Value'))),
            ])
          ],
        ),
      ),
    );
  }
}
