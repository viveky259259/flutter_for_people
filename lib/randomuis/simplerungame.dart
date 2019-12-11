import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RunHomePage());
  }
}

class RunHomePage extends StatefulWidget {
  @override
  State createState() => RunHomePageState();
}

class RunHomePageState extends State<RunHomePage> {
  double red = 0;
  double blue = 0;
  GlobalKey _keyRed = GlobalKey();
  GlobalKey _keyBlue = GlobalKey();
  GlobalKey _keyWinningLine = GlobalKey();
  GlobalKey _keyAppBar = GlobalKey();

  checkForWinner() async {
    setState(() {});

    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final RenderBox renderBoxBlue = _keyBlue.currentContext.findRenderObject();
    final redSize = renderBoxRed.size;
    final blueSize = renderBoxBlue.size;
    final redOffset = renderBoxRed.localToGlobal(Offset.zero);
    final blueOffset = renderBoxBlue.localToGlobal(Offset.zero);

    final winLineSize =
        (_keyWinningLine.currentContext.findRenderObject() as RenderBox).size;
    final winLineOffset =
        (_keyWinningLine.currentContext.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);

    if (redOffset.dy - redSize.height <=
        winLineSize.height + winLineOffset.dy) {
      print("red");

      await Future.delayed(Duration(seconds: 1));
      red = 0;
      blue = 0;
      setState(() {});
    } else if (blueOffset.dy - blueSize.height <=
        winLineSize.height + winLineOffset.dy) {
      print("blue");

      await Future.delayed(Duration(seconds: 1));
      red = 0;
      blue = 0;
      setState(() {});
    } else {
      print("red ${redSize.toString()}:: ${redOffset.toString()}");
      print("blue ${blueSize.toString()}:: ${blueOffset.toString()}");
      print("win ${winLineSize.toString()}:: ${winLineOffset.toString()}");

      print("no one");
    }
  }

  AppBar appBar;

  @override
  void initState() {
    appBar = AppBar(key: _keyAppBar, title: Text("Flutter Run"));
  }

  @override
  Widget build(BuildContext context) {
    print(appBar.preferredSize.height);
    return Scaffold(
        appBar: appBar,
        body: Stack(
          children: <Widget>[
            Container(
              key: _keyWinningLine,
              height: 75,
              color: Colors.black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  appBar.preferredSize.height,
//                  MediaQuery.of(context).padding.top,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        CircleAvatar(
                          key: _keyBlue,
                        ),
                        AnimatedContainer(
                            duration: Duration(milliseconds: 324),
                            height: blue * 50),
                        RaisedButton(
                          child: Text("Tap"),
                          onPressed: () {
                            blue++;
                            checkForWinner();
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        CircleAvatar(
                          key: _keyRed,
                          backgroundColor: Colors.red,
                        ),
                        AnimatedContainer(
                            duration: Duration(milliseconds: 324),
                            height: red * 50),
                        RaisedButton(
                          child: Text("Tap"),
                          onPressed: () {
                            red++;

                            checkForWinner();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
