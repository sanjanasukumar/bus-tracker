import 'package:flutter/material.dart';
import 'signIn.dart';
import 'signUp.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navToSignIn,
            child: Text('Sign In'),
          ),
          RaisedButton(
            onPressed: navToSignUp,
            child: Text('Sign Up'),
          )
        ],
      ),
    );
  }

  void navToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(), fullscreenDialog: true),
    );
  }

  void navToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignUpPage(), fullscreenDialog: true),
    );
  }
}
