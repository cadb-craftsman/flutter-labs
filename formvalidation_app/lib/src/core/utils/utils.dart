import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isNumeric(String value) {
  if (value.isEmpty) {
    return false;
  }

  final number = num.tryParse(value);

  return (number == null) ? false : true;
}

void showAlertMessage(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return _buildAlertDialog(context, message);
      });
}

Widget _buildAlertDialog(BuildContext context, String message) {
  return AlertDialog(
    title: Text('Incorrect Information'),
    content: Text(message),
    actions: [
      FlatButton(
        child: Text('Ok'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ],
  );
}
