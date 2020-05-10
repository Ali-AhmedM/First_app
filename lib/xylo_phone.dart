import 'package:a3uiapp1/home_page.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XylophoneApp extends StatefulWidget {
  static const routeName = 'XylophoneApp';

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSound(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  Expanded buildKey({int soundNumber, Color keyColor}) => Expanded(
        child: FlatButton(
          onPressed: () {
            playSound(soundNumber);
          },
          color: keyColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Transform.translate(
          child: Center(
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                final player = AudioCache();
                player.play('back.mp3');
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          offset: Offset(-100, -210),
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(soundNumber: 1, keyColor: Colors.red),
            buildKey(soundNumber: 2, keyColor: Colors.orange),
            buildKey(soundNumber: 3, keyColor: Colors.yellow),
            buildKey(soundNumber: 4, keyColor: Colors.green),
            buildKey(soundNumber: 5, keyColor: Colors.teal),
            buildKey(soundNumber: 6, keyColor: Colors.blue),
            buildKey(soundNumber: 7, keyColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}
