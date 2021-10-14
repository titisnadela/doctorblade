import 'package:doctor_blade/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() {
  // ignore: prefer_const_constructors
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.amber,
  // )
  // );
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Blade',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
