import 'package:flutter/material.dart';
import 'package:gesturedetector_app/DetectorHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData( primarySwatch: Colors.blue,),
      home: DetectorHome(title: 'Home page'),
    );
  }
}


