import 'package:flutter/material.dart';
import 'package:pagination/pagination.dart';

class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  ScrollController _scrollController;
  List<int> list = List.generate(9, (index) => index);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      print(_scrollController.position.context);
      Future.delayed(Duration(seconds: 5));
      list.addAll(List.generate(10, (index) => index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView Example"),
        ),
        body: PaginationList(
          pageFetch: (offset) async {
            await Future.delayed(Duration(seconds: 5));
            list.addAll(List.generate(10, (index) => index));
            return list;
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(index.toString()),
            );
          },
          onEmpty: ListTile(
            title: Text("Empty"),
          ),
          onError: (error) => ListTile(title: Text("Error")),
        ));
  }
}
