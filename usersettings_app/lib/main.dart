import 'package:flutter/material.dart';
import 'package:usersettings_app/src/presentation/pages/home_page.dart';
import 'package:usersettings_app/src/presentation/pages/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Settings App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}
