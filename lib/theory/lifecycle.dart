import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeCycleExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LifeCycleExampleState();
  }
}

class LifeCycleExampleState extends State<LifeCycleExample> {
  @override
  void initState() {
    super.initState();
    print("First: initState");
  }

  @override
  Widget build(BuildContext context) {
    print("First: build");
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: ()async{
              setState(() {
                print("setting state");
              });
              await Future.delayed(Duration(seconds: 10));
              Navigator.pushReplacement(context, MaterialPageRoute( builder: (context)=>SecondClass()));
            },
            child: Text("This is first page")),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    print("First: dispose");
  }

  @override
  bool get mounted {
    print("First: mounted");
  }

  @override
  void didUpdateWidget(oldWidget) {
    print("First: didUpdateWidget");
  }

  @override
  void reassemble() {
    print("First: reassemble");
  }

  @override
  void deactivate() {
    print("First: deactivate");
  }

  @override
  void didChangeDependencies() {
    print("First: didChangeDependencies");
  }

  @override
  void debugFillProperties(properties) {
    print("First: debug Fill properties");
  }
}

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Second: build");
    return Scaffold(
      body: Center(
        child: Text("This is second page "),
      ),
    );
  }
}
