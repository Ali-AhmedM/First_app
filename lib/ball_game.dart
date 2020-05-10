import 'dart:math';
import 'package:a3uiapp1/home_page.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  static const routeName = 'Ball';

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  final player = AudioCache();

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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Ask Me Anything \nthen click on this photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'SourceSansPro'),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(
                    () {
                      ballNumber = Random().nextInt(5) + 1;
                    },
                  );
                  player.play('ball$ballNumber.mp3');
                },
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/ball$ballNumber.png'),
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
