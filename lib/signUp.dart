import 'dart:ui';

import 'package:bus_trackerv2/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _busNo, _busStop;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        //TODO Style the form
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                } else if (!input.contains('ssn.edu.in')) {
                  return 'Please Use only SSN email ID';
                }
                return null;
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an password';
                } else
                  return null;
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Can\'t be blank';
                } else
                  return null;
              },
              onSaved: (input) => _busNo = input,
              decoration: InputDecoration(labelText: 'Bus Number'),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Can\'t be blank';
                } else
                  return null;
              },
              onSaved: (input) => _busStop = input,
              decoration: InputDecoration(labelText: 'Bus Stop'),
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email, password: _password))
            .user;
        user.sendEmailVerification();
        addData({'email': user.email, 'busNo': _busNo, 'busStop': _busStop});
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(), fullscreenDialog: true),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }

  Future<void> addData(userData) async {
    Firestore.instance.collection('users').add(userData).catchError((e) {
      print(e);
    });
  }
}
