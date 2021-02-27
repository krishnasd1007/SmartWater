import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttonpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController em = new TextEditingController();
  final TextEditingController ps = new TextEditingController();

  void firesign() async {
    final User user = (await auth.signInWithEmailAndPassword(
            email: em.text, password: ps.text))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LedApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue[100],
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.2),
              ),
              Text('USERNAME'),
              TextFormField(),
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.01),
              ),
              Text('PASSWORD'),
              TextFormField(),
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.01),
              ),
              RaisedButton(
                onPressed: () {
                  firesign();
                },
                child: Text('REGISTER'),
                color: Colors.lightBlue[800],
              )
            ],
          ),
        ),
      ),
    );
  }
}
