import 'package:flutter/material.dart';
import 'package:tong_news/screens/news_list.dart';
import 'package:tong_news/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

  // Method
  @override
  void initState() {
    super.initState();
    loadCurrentUser();
  }

  Future loadCurrentUser() async {
    await firebaseAuth.currentUser().then((objValue) {
      if (objValue != null) {
        print('Logined');
        moveToNewsList(context);
      }
    });
  }

  void moveToNewsList(BuildContext context) {
    var newsListRoute =
        MaterialPageRoute(builder: (BuildContext context) => NewsList());
    Navigator.of(context)
        .pushAndRemoveUntil(newsListRoute, (Route<dynamic> route) => false);
  }

  Widget mySizebox() {
    return SizedBox(
      width: 3.0,
    );
  }

  Widget showButton(BuildContext context) {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signIn(),
          ),
          mySizebox(),
          Expanded(
            child: singUp(context),
          ),
        ],
      ),
    );
  }

  Widget singUp(BuildContext context) {
    return RaisedButton(
      color: Colors.orange[400],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        // Create Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signIn() {
    return RaisedButton(
      color: Colors.orange[900],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Email = $emailString, Pass = $passwordString');
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Success Login');
    }).catchError((response) {
      String errorString = response.message;
      print('errorSting = $errorString');
    });
  }

  Widget emailTextFormField() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 250.0,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Email :', helperText: 'your@email.com'),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Fill Email';
            }
          },
          onSaved: (String value) {
            emailString = value;
          },
        ),
      ),
    );
  }

  Widget passwordTextFormField() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password :', helperText: 'More 6 Charactor'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type Password in Blank';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 150.0,
        height: 150.0,
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget showName() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Text(
        'Tong News',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange[900],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.white, Colors.orange[700]],
              radius: 1.5,
              center: Alignment(0, 0)),
        ),
        padding: EdgeInsets.only(top: 80.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showName(),
              emailTextFormField(),
              passwordTextFormField(),
              showButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
