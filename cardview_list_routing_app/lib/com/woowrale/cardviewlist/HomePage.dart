import 'package:cardview_list_routing_app/com/woowrale/cardviewlist/Product.dart';
import 'package:cardview_list_routing_app/com/woowrale/cardviewlist/ProductBox.dart';
import 'package:cardview_list_routing_app/com/woowrale/cardviewlist/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{

  final String title;
  final items = Product.getProduct();

  HomePage({Key key, this.title}): super(key:key);

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Product Navigation"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(item: items[index])));
              },
            );
          }
      ),
    );
    return scaffold;
  }

}