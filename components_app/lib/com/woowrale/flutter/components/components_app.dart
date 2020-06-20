import 'package:flutter/material.dart';

class ComponentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Components App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World Flutter Components'),
          ),
        ),
      ),
    );
  }
}