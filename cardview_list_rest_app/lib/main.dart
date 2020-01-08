import 'package:cardview_list_rest_app/cardviewlist/HomePage.dart';
import 'package:cardview_list_rest_app/cardviewlist/NetworkServices.dart';
import 'package:cardview_list_rest_app/cardviewlist/Product.dart';
import 'package:flutter/material.dart';

NetworkServices ns = NetworkServices();

void main() => runApp(MyApp(products: ns.fetchProducts()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<List<Product>> products;
  MyApp({Key key, this.products}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Product Navigation demo home page', products: products),
    );
  }
}
