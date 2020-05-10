import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlackScreen extends StatefulWidget {
  static const routeName = 'BlackScreen';

  @override
  _BlackScreenState createState() => _BlackScreenState();
}

class _BlackScreenState extends State<BlackScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Center(child: Image.asset('images/heart.jpg')),
          ),
        ),
      ),
    );
  }
}
