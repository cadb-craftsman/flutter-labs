import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_router_builder/route.dart';

class Page1 extends StatelessWidget {

  AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go !'),
            onPressed: () {
              Navigator.of(context).push(appRoute.createRoute());
            }),
      ),
    );

    return scaffold;
  }
}
