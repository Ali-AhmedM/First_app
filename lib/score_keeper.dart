import 'package:a3uiapp1/home_page.dart';
import 'package:a3uiapp1/question_prain.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.

import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  static const routeName = 'Quizzler';

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuestionBrain question = QuestionBrain();
  final player = AudioCache();
  int count = 1;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = question.getQuestionAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (question.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        player.play('congratulations.mp3');

        Alert(
          context: context,
          style: alertStyle,
          title: "Congratulations!",
          desc: "result: $count/8",
          image: Image.asset(
            "images/quizman.png",
            scale: 3,
          ),
          buttons: [
            DialogButton(
              child: Text(
                "Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                player.play('again.mp3');

                Navigator.pop(context);
                count = 1;
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
            DialogButton(
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                player.play('home.mp3');
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        question.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));

          count++;

          player.play('right.mp3');
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          player.play('wrong.mp3');
        }
        question.nextQuestion();
      }
    });
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 500),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle:
        TextStyle(color: Colors.red, fontFamily: 'Pacifico', fontSize: 25),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Transform.translate(
        child: SafeArea(
          child: Center(
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {
                player.play('back.mp3');
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        offset: Offset(-100, -210),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Container(
        //TODO: margin
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // أسئلة إسلامية
            Expanded(
              child: Transform.translate(
                child: Text(
                  "أسئلة إسلامية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rakkas Regular',
                  ),
                ),
                offset: Offset(50, 50),
              ),
            ),
            Transform.translate(
              child: Divider(
                indent: 80,
                endIndent: 80,
                color: Colors.blueGrey[900],
                thickness: 2,
              ),
              offset: Offset(50, 50),
            ),
            // ثمانية أسئلة
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    question.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey[900],
              thickness: 2,
            ),
            // true button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.translate(
                  child: FlatButton(
                    child: ListTile(
                      title: Text(
                        "True",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
//                  Image.asset('images/true.png'),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  offset: Offset(70, 0),
                ),
              ),
            ),
            Divider(
              indent: 60,
              endIndent: 60,
              color: Colors.blueGrey[900],
              thickness: 2,
            ),
            // false button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Transform.translate(
                    child: ListTile(
                      title: Text(
                        "False",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    offset: Offset(70, 0),
                  ),
//                  Image.asset('images/false.png'),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.blueGrey[900],
              thickness: 2,
            ),
            SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 10,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreKeeper,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
