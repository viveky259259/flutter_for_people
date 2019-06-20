import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  TextEditingController _controller = new TextEditingController();
  String numbersStory = "";
  String baseUrl = "http://numbersapi.com/";

  TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  TextStyle textTextStyle = TextStyle(
    fontSize: 16,
  );

  makeHttpCall() async {
    String number = _controller.text;
    var response = await http.get("$baseUrl$number");
    numbersStory = response.body;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Http Example"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "$numbersStory",
                  style: textTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.change_history,
                        color: Color.fromARGB(0xff, 0xf0, 0x7d, 0x00),
                      ),
                    ),
                    //#f07d00
                    hintMaxLines: 1,
                    border: InputBorder.none,
                    hintText: "Any number",
                  ),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  onChanged: (v) {
                    makeHttpCall();
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 16),
              RaisedButton(
                color: Colors.blue,
                splashColor: Colors.blue.shade300,
                onPressed: () {
                  makeHttpCall();
                },
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Submit".toUpperCase(),
                      style: buttonTextStyle,
                    )),
              )
            ],
          )),
    );
  }
}
