import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
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
      body: Container(
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
    );
  }
}
