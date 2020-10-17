import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert Message'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('¿Realmente desea cerrar este mensaje de alert?'),
                FlutterLogo(
                  size: 80,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop())
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          );
        });
  }
}
