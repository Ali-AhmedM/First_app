import 'package:a3uiapp1/home_page.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const routeName = 'ContactUs';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/a20.jpg'),
//              backgroundImage: AssetImage('images/pic2.jpg'),
              backgroundColor: Colors.teal,
//              child: Container(
//                width: 200,
//                height: 200,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage('images/a20.jpg'),
////                    colorFilter: ColorFilter.srgbToLinearGamma(),
//                  ),
//                ),
//              ),
            ),
            Text(
              "Ali Ahmed",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Colors.teal.shade100,
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                color: Colors.teal[900],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  "01022033579",
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  "MrAliAhmedM@gmail.com",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.teal.shade900,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
            Transform.translate(
              child: Text(
                "BY Ali Ahmed @ 10/5/2020",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              offset: Offset(0, 80),
            ),
          ],
        ),
      ),
    );
  }
}
