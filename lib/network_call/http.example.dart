import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  String apiResponse;

  void getCall() async {
    try {
      //http://demo2971538.mockable.io/getName => Mock Api for get Call
      Response response = await get("http://demo2971538.mockable"
          ".io/getName");
      var jsonResult = json.decode(response.body);
      if (response.statusCode == 200) {
        apiResponse = jsonResult.toString();
        setState(() {});
      } else {
        apiResponse = "Error";
        setState(() {});
      }
    } catch (e) {
      apiResponse = e.toString();
      setState(() {});
    }
  }

  void postCall() async {
    try {
      //http://demo2971538.mockable.io/getName => Mock Api for get Call
      Response response = await post("http://demo2971538.mockable"
          ".io/postName");
      var jsonResult = json.decode(response.body);
      if (response.statusCode == 200) {
        apiResponse = jsonResult.toString();
        setState(() {});
      } else {
        apiResponse = "Error";
        setState(() {});
      }
    } catch (e) {
      apiResponse = e.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Text(apiResponse ?? "")),
          Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  getCall();
                },
                child: Text('Get'),
              ),
              RaisedButton(
                onPressed: () {
                  postCall();
                },
                child: Text('Post'),
              )
            ],
          )
        ],
      ),
    );
  }
}
