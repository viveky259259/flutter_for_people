import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  String birthDate = "";
  int age = -1;
  TextStyle valueTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  TextStyle textTextStyle = TextStyle(
    fontSize: 16,
  );
  TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    Completer completer = Completer();
    String _selectedDateInString;
    if (Platform.isAndroid)
      showDatePicker(
              context: context,
              initialDate: initialDateTime,
              firstDate: DateTime(1970),
              lastDate: lastDate == null
                  ? DateTime(initialDateTime.year + 10)
                  : lastDate)
          .then((temp) {
        if (temp == null) return null;

//        _selectedDateInString = df.format(temp);
        completer.complete(temp);
        setState(() {});
      });
    else
      DatePicker.showDatePicker(
        context,
        dateFormat: 'yyyy-mmm-dd',
        locale: 'en',
        onConfirm2: (temp, selectedIndex) {
          if (temp == null) return null;
//          final df = new DateFormat('dd-MMM-yyyy');
//          _selectedDateInString = df.format(temp);
          completer.complete(temp);

          setState(() {});
        },
      );
    return completer.future;
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (age > -1)
                ? Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(12, 12)),
                            border: Border.all(color: Colors.grey)),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "BirthDate: ",
                              style: textTextStyle,
                            ),
                            Text(
                              "$birthDate",
                              style: valueTextStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(12, 12)),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Age: ",
                              style: textTextStyle,
                            ),
                            Text(
                              "$age",
                              style: valueTextStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : Text("Press button to see age"),
            SizedBox(
              height: 32,
            ),
            RaisedButton(
              color: Colors.blue,
              splashColor: Colors.blue.shade300,
              onPressed: () async {
                DateTime birthDate = await selectDate(context, DateTime.now(),
                    lastDate: DateTime.now());
                final df = new DateFormat('dd-MMM-yyyy');
                this.birthDate = df.format(birthDate);
                this.age = calculateAge(birthDate);

                setState(() {});
              },
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Select birthdate".toUpperCase(),
                    style: buttonTextStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
