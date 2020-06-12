import 'package:flutter/material.dart';

import 'package:app/src/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Center(child: HomePage()),
    );
  }
}