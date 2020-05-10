import 'dart:math';
import 'package:a3uiapp1/home_page.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  static const routeName = 'DiceGame';
  static bool one;

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int x = 1;

  void printPIC() {
    setState(
      () {
        x = Random().nextInt(6) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 50),
                child: FlatButton(
                  onPressed: () {
                    printPIC();
                    final player = AudioCache();
                    player.play('$x.mp3');
                  },
                  child: Text(
                    "إضغط على الصورة",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Rakkas Regular',
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: FlatButton(
                  onPressed: () {
                    printPIC();
                    final player = AudioCache();
                    player.play('$x.mp3');
                  },
                  child: Image.asset('images/dice$x.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
