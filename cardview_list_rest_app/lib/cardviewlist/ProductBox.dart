import 'package:cardview_list_rest_app/cardviewlist/Product.dart';
import 'package:cardview_list_rest_app/cardviewlist/RatingBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductBox extends StatelessWidget{
  final Product item;
  ProductBox({Key key, this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/" + this.item.image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price: " + this.item.price.toString()),
                    RatingBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return container;
  }

}