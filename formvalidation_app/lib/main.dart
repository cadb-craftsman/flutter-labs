import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/presentation/bloc/provider.dart';
import 'package:formvalidation_app/src/presentation/pages/home_page.dart';
import 'package:formvalidation_app/src/presentation/pages/login_page.dart';
import 'package:formvalidation_app/src/presentation/pages/product_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(child: _buildMaterialApp());
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        ProductPage.routeName: (BuildContext context) => ProductPage(),
      },
    );
  }
}
