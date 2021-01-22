import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/core/settings/user_settings.dart';
import 'package:formvalidation_app/src/features/presentation/bloc/provider.dart';
import 'package:formvalidation_app/src/features/presentation/pages/home_page.dart';
import 'package:formvalidation_app/src/features/presentation/pages/login_page.dart';
import 'package:formvalidation_app/src/features/presentation/pages/product_page.dart';
import 'package:formvalidation_app/src/features/presentation/pages/register_page.dart';

void main() async {
  runApp(MyApp());
  final prefs = new UserSettings();
  await prefs.initPrefs();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(child: _buildMaterialApp());
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        RegisterPage.routeName: (BuildContext context) => RegisterPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        ProductPage.routeName: (BuildContext context) => ProductPage(),
      },
    );
  }
}
