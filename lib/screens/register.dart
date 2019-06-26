import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          register();
        }
      },
    );
  }

  Future register() async {
    print('name = $nameString, email = $emailString, pass = $passwordString');
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objResponse) {
      print('Register Success');

      setupDisplayName();
    }).catchError((objResponse) {
      String error = objResponse.message;
      print('Error = $error');
      _showDialog(error);
    });
  }

  Future setupDisplayName() async {
    await firebaseAuth.currentUser().then((objValue) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      objValue.updateProfile(userUpdateInfo);
    });
  }
  


  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Register'),
          content: Text('Becaurse : $message'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Widget nameText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Display Name :',
          labelStyle: TextStyle(color: Colors.orange[700]),
          hintText: 'Your First Name',
          icon: Icon(
            Icons.face,
            color: Colors.orange[700],
            size: 36.0,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Display Name';
          }
        },
        onSaved: (String value) {
          nameString = value;
        },
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Your Email :',
          labelStyle: TextStyle(color: Colors.green[800]),
          hintText: 'you@email.com',
          icon: Icon(
            Icons.email,
            color: Colors.green[800],
            size: 36.0,
          ),
        ),
        validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type Email Format';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.pink[400]),
          hintText: 'More 6 Charactor',
          icon: Icon(
            Icons.lock_open,
            color: Colors.pink[400],
            size: 36.0,
          ),
        ),
        validator: (String value) {
          if (value.length <= 5) {
            return 'More 6 Charactor';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[uploadButton()],
        backgroundColor: Colors.orange[700],
        title: Text('Register'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              nameText(),
              userText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
