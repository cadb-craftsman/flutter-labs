
import 'package:flutter/material.dart';

import 'package:components/src/com/woowrale/pages/alert_page.dart';
import 'package:components/src/com/woowrale/routes/routes.dart';

void main() => runApp(ComponentApp());

class ComponentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        //print('Call Path ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
