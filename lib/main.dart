import 'package:flutter/material.dart';
import 'package:tong_news/screens/authen.dart';
import 'package:flutter/services.dart';
import 'package:tong_news/screens/register.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Authen(),
    );
  }
}
