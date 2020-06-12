import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final textStyleBody = TextStyle(fontSize: 20.0);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de clicks:',
              style: textStyleBody,
            ),
            Text(
              '$_counter',
              style: textStyleBody,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counter += 1;
          print('counter: $_counter');
        },
      ),
    );
  }
}
