import 'dart:async';
import 'package:flutter/material.dart';
import 'auth.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      navigate();
    });
  }

  void navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Container(
        height: ht,
        width: wt,
        color: Colors.lightBlue[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: ht * 0.7,
              width: wt,
              color: Colors.lightBlue[300],
              child: Center(
                child: new Image.asset(
                  '',
                  width: wt * 0.5,
                  height: ht * 0.5,
                ),
              ),
            ),
            Container(
              height: ht * 0.1,
              width: wt * 0.2,
              color: Colors.lightBlue[300],
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
