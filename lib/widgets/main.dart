import 'package:flutter/material.dart';
import 'package:flutter_for_people/packages/pagination.example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginationHomePage(),
    );
  }
}
