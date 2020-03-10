import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love Voice',
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new SendEmail(),
    );
  }
}

class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {


  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListining = false;

  String resultText = "";

  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
            (bool result) => setState(() => _isAvailable = result));
    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListining = true),
    );
    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState((){
            resultText = speech;

          }),
    );
    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListining = false),
    );
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Helper hand')),
      body: Center(
        child: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.cancel),
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    onPressed: () {
                      if (_isListining)
                        _speechRecognition
                            .cancel()
                            .then((result) => setState(() {
                          _isListining = result;
                          resultText = "";
                        }));
                    }),
                FloatingActionButton(
                    child: Icon(Icons.mic),
                    backgroundColor: Colors.pink,
                    onPressed: () {
                      if (_isAvailable && !_isListining)
                        _speechRecognition.listen(locale: "en_US");
                    }),
                FloatingActionButton(
                    child: Icon(Icons.stop),
                    mini: true,
                    backgroundColor: Colors.deepPurple,
                    onPressed: () {
                      if (_isListining)
                        _speechRecognition.stop().then(
                              (result) => setState(() => _isListining = result),
                        );
                    }),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent[100],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 24.0),
                )),
            /*
            this is for the mail send button
            */

          ],
        ),
      ),
    );
  }
}