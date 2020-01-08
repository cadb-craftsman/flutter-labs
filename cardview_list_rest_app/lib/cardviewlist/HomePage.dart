import 'package:cardview_list_rest_app/cardviewlist/Product.dart';
import 'package:cardview_list_rest_app/cardviewlist/ProductBoxList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;

  HomePage({Key key, this.title, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
        appBar: AppBar(
          title: Text("Product Navigation"),
        ),
        body: Center(
          child: FutureBuilder<List<Product>>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                } else if (snapshot.hasData) {
                  return ProductBoxList(items: snapshot.data);
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
    return scaffold;
  }
}
