import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(SpeedoMeter());

class SpeedoMeter extends StatefulWidget {
  @override
  _SpeedoMeterState createState() => _SpeedoMeterState();
}

class _SpeedoMeterState extends State<SpeedoMeter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  double angle = 0;
  double angle2 = 0;

  start() {
    Timer.periodic(Duration(microseconds: 1000), (t) {
      setState(() {
        angle++;
        if (angle > 180) angle = 0;
      });
    });
    Timer.periodic(Duration(milliseconds: 100), (t) {
      setState(() {
        angle2++;
        if (angle2 > 180) angle2 = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Container(
                  child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
          GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
          GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
          GaugeRange(startValue: 100, endValue: 150, color: Colors.red),
          GaugeRange(startValue: 150, endValue: 180, color: Colors.yellow)
        ], pointers: <GaugePointer>[
          NeedlePointer(value: angle),
          NeedlePointer(value: angle2)
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Container(
                  child: Text('90.0',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              angle: 90,
              positionFactor: 0.5)
        ])
      ])))),
    );
  }
}
