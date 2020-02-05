/*
* Solution for https://stackoverflow.com/questions/59997021/update-bottomnavigationbar-when-tapping-on-button/
* */

import 'package:flutter/material.dart';

class DynamicBottomNavigationBarExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DynamicBottomNavigationBarExampleState();
  }
}

class DynamicBottomNavigationBarExampleState
    extends State<DynamicBottomNavigationBarExample> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("People")),
    BottomNavigationBarItem(icon: Icon(Icons.help), title: Text("Help")),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Setting")),
  ];
  bool isHighLighted = false;
  int currentIndex = 0;

  void onTapBottomNavigationItem(index) {
    if (index == null) return;
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic BottomNavigation bar"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              setState(() {
                isHighLighted = !isHighLighted;
              });
            },
            child: Text(
                "Click me  to ${!isHighLighted ? 'Highlight' : "Not Highlight"}")),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          items, isHighLighted, currentIndex, onTapBottomNavigationItem),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final bool isHighLighted;
  final int selectedIndex;
  final Function onTapBottomNavigationItem;

  CustomBottomNavigationBar(this.items, this.isHighLighted, this.selectedIndex,
      this.onTapBottomNavigationItem);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white54,
      backgroundColor:
          isHighLighted ? Colors.blue.shade900 : Colors.blue.shade300,
      items: items,
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: onTapBottomNavigationItem,
    );
  }
}
