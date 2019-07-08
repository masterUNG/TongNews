import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tong_news/screens/authen.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  // Explicit

  // Method
  Widget menuDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHeadDrawer(),
          signOutButton(),
        ],
      ),
    );
  }

  Widget signOutButton() {
    return ListTile(
      title: Text(
        'Sign Out',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      leading: Icon(Icons.exit_to_app),
      onTap: () {
        Navigator.of(context).pop();
        signOutThread();
      },
    );
  }

  Future<void> signOutThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      var authenRoute =
          MaterialPageRoute(builder: (BuildContext context) => Authen());
      Navigator.of(context)
          .pushAndRemoveUntil(authenRoute, (Route<dynamic> route) => false);
    });
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.yellow),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Tong News',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New List'),
      ),
      body: Text('body'),
      drawer: menuDrawer(),
    );
  }
}
