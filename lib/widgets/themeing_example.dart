import 'package:flutter/material.dart';

void main() => runApp(InitApp());

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(child: ThemeApp());
  }
}

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeInheritedWidget.of(context).isLightTheme
          ? Themes.lightTheme
          : Themes.darkTheme,
      home: HomeScreen(),
    );
  }
}

class ThemeInheritedWidget extends InheritedWidget {
  bool isLightTheme;

  ThemeInheritedWidget({child, key})
      : super(child: child, key: key ?? GlobalKey()) {
    isLightTheme = true;
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) =>
      oldWidget.isLightTheme != isLightTheme;

  static ThemeInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }

  changeMode() {
    isLightTheme = !isLightTheme;
    this.updateShouldNotify(this);
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void changeMode() {
    ThemeInheritedWidget.of(context).changeMode();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
          itemBuilder: (context, index) {
            return RaisedButton(
                padding: EdgeInsets.all(16),
                onPressed: changeMode,
                child: Text(
                  'Change Theme Mode',
                ));
          }),
    );
  }
}

class Themes {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(color: Colors.blue),
      buttonColor: Colors.blue,
      textTheme: TextTheme(button: TextStyle(color: Colors.white)));
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(color: Colors.redAccent),
      buttonColor: Colors.yellow,
      textTheme: TextTheme(button: TextStyle(color: Colors.black)));
}
