import 'package:cardview_list_rest_app/cardviewlist/Product.dart';
import 'package:cardview_list_rest_app/cardviewlist/ProductBox.dart';
import 'package:cardview_list_rest_app/cardviewlist/ProductPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBoxList extends StatelessWidget{
  final List<Product> items;
  ProductBoxList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.builder(
        itemCount: items.length,
      itemBuilder: (context, index){
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index])
                  ),
              );
            },
          );
      },
    );
    return listView;
  }
}