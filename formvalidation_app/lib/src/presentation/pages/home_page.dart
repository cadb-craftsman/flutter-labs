import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/presentation/bloc/provider.dart';
import 'package:formvalidation_app/src/presentation/pages/product_page.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, ProductPage.routeName);
        });
  }
}
