import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget mySizebox() {
    return SizedBox(
      width: 3.0,
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signIn(),
          ),
          mySizebox(),
          Expanded(
            child: singUp(),
          ),
        ],
      ),
    );
  }

  Widget singUp() {
    return RaisedButton(
      color: Colors.orange[400],
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget signIn() {
    return RaisedButton(
      color: Colors.orange[900],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget emailTextFormField() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 250.0,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Email :', helperText: 'your@email.com'),
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
            radius: 1.5, center: Alignment(0, 0)
          ),
        ),
        padding: EdgeInsets.only(top: 80.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showName(),
            emailTextFormField(),
            passwordTextFormField(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
