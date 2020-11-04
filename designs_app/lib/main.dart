import 'package:flutter/material.dart';
import 'package:designs_app/src/pages/basic_design.dart';
import 'package:designs_app/src/pages/buttons_page.dart';
import 'package:designs_app/src/pages/scroll_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));
    */
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'buttons',
        routes: {
          'basic': (context) => BasicDesign(),
          'scroll': (context) => ScrollPage(),
          'buttons': (context) => ButtonsPage(),
        });
  }
}
