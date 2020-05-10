import 'dart:async';
import 'dart:io';
import 'package:a3uiapp1/ball_game.dart';
import 'package:a3uiapp1/black_screen.dart';
import 'package:a3uiapp1/contact_us.dart';
import 'package:a3uiapp1/dice_game.dart';
import 'package:a3uiapp1/score_keeper.dart';
import 'package:a3uiapp1/xylo_phone.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playSound(String name) {
    final player = AudioCache();
    player.play(name);
  }

  FlatButton buildFlatButton(
      {String classDOTrouteName, String LabelText, String wordSound}) {
    return FlatButton(
      onPressed: () {
        playSound(wordSound);
        Future.delayed(
          const Duration(milliseconds: 200),
          () {
            Navigator.of(context).pushReplacementNamed(classDOTrouteName);
          },
        );
      },
      child: Text(
        LabelText,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceSansPro',
            color: Colors.white),
      ),
    );
  }

  Divider smallline() {
    return Divider(
      indent: 80,
      endIndent: 80,
      thickness: 2,
      color: Colors.blueGrey[900],
    );
  }

  Divider thickline() {
    return Divider(
      indent: 50,
      endIndent: 50,
      thickness: 5,
      color: Colors.blueGrey[900],
    );
  }

  @override
  Widget build(BuildContext context) {
    // hello sound effect
    if (DiceGame.one == null) {
      print(DiceGame.one);
      playSound('hello.mp3');
      DiceGame.one = true;
    }
    print(DiceGame.one);

    return Scaffold(
      // to exit after 3 sec
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, BlackScreen.routeName);
          playSound('close.mp3');
          DiceGame.one = null;

          Future.delayed(
            const Duration(milliseconds: 1700),
            () {
              // to exit
              exit(0);
            },
          );
        },
        child: Icon(Icons.close),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/manpic.png'),
//                    colorFilter: ColorFilter.srgbToLinearGamma(),
                  ),
                ),
              ),
              thickline(),
              Center(
                  child: Text(
                "Hello.. Hi",
                style: TextStyle(color: Colors.blueGrey[900]),
              )),
              smallline(),
              buildFlatButton(
                classDOTrouteName: DiceGame.routeName,
                LabelText: 'Dice Game',
                wordSound: 'dice.mp3',
              ),
              smallline(),
              buildFlatButton(
                classDOTrouteName: Ball.routeName,
                LabelText: 'Ball Game',
                wordSound: 'ball.mp3',
              ),
              smallline(),
              buildFlatButton(
                classDOTrouteName: XylophoneApp.routeName,
                LabelText: 'Xylophone Game',
                wordSound: 'xylophone.mp3',
              ),
              smallline(),
              buildFlatButton(
                classDOTrouteName: Quizzler.routeName,
                LabelText: 'Quizzler Game',
                wordSound: 'quizzler.mp3',
              ),
              smallline(),
              buildFlatButton(
                classDOTrouteName: ContactUs.routeName,
                LabelText: 'Contact us',
                wordSound: 'contact.mp3',
              ),
              thickline(),
            ],
          ),
        ),
      ),
    );
  }
}
