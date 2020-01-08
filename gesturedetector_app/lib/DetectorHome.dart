import 'package:flutter/material.dart';

class DetectorHome extends StatelessWidget {
  DetectorHome({Key key, this.title}) : super(key: key);
  final String title;

  // user defined function
  void _showDialog(BuildContext context) {
    // flutter defined function showDialog(
    context: context;
    builder: (BuildContext context) {
      // return object of type Dialog return AlertDialog(
      title: new Text("Message");
      content: new Text("Hello World");
      actions: <Widget>[
        new FlatButton(
          child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ];
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center(
          child: GestureDetector(
              onTap: () {
                _showDialog(context);
              },
              child: Text('Hello World',)
          )
      ),
    );
  }
}