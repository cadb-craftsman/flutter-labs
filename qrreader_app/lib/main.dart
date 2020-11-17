import 'package:flutter/material.dart';

import 'package:qrreader_app/src/presentation/pages/map_page.dart';
import 'package:qrreader_app/src/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR-Reader',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'map': (context) => MapPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}
