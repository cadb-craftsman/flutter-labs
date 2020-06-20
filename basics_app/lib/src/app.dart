import 'package:flutter/material.dart';

import 'package:app/src/pages/contador_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: ContadorPage()),
    );
  }
}