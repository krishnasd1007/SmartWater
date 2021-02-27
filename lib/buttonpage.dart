import 'package:flutter/material.dart';
import 'chatpage.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LedApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LedApp extends StatefulWidget {
  @override
  _LedAppState createState() => _LedAppState();
}

class _LedAppState extends State<LedApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('WATER APP'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[800],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatPage()));
          },
          backgroundColor: Colors.lightBlue[800],
          child: Text('chat'),
        ),
        backgroundColor: Colors.lightBlue[100],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () async {
                    print(await http.read(
                        'http://lednodebackend.herokuapp.com/toggleLedStatus'));
                  },
                  child: Text('ON/OFF'),
                  color: Colors.lightBlue[800],
                ),
                //Padding(padding: EdgeInsets.all(15.0)),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('LOGOUT'),
                  color: Colors.lightBlue[800],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
