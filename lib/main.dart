import 'package:a3uiapp1/ball_game.dart';
import 'package:a3uiapp1/black_screen.dart';
import 'package:a3uiapp1/contact_us.dart';
import 'package:a3uiapp1/dice_game.dart';
import 'package:a3uiapp1/home_page.dart';
import 'package:a3uiapp1/score_keeper.dart';
import 'package:a3uiapp1/xylo_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //to prevent my application from changing its orientation.
    // and force the layout to stick to "portrait".
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        DiceGame.routeName: (_) => DiceGame(),
        Ball.routeName: (_) => Ball(),
        XylophoneApp.routeName: (_) => XylophoneApp(),
        Quizzler.routeName: (_) => Quizzler(),
        BlackScreen.routeName: (_) => BlackScreen(),
        ContactUs.routeName: (_) => ContactUs(),
      },
    );
  }
}
