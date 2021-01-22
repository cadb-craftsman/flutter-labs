import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/presentation/bloc/product_bloc.dart';
import 'package:formvalidation_app/src/features/presentation/pages/product_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductBloc _productBloc = new ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildStreamBuilder(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildStreamBuilder() {
    return StreamBuilder(
        stream: _productBloc.productStreamController,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return _buildListView(snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _buildListView(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) => _buildDismissible(context, products[i]));
  }

  Widget _buildDismissible(BuildContext context, Product product) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          setState(() {
            _productBloc.deleteProduct(product);
          });
        },
        child: _buildCard(context, product));
  }

  Widget _buildCard(BuildContext context, Product product) {
    return Card(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _buildImageProduct(product),
          _buildListTile(context, product),
        ],
      ),
    );
  }

  Widget _buildImageProduct(Product product) {
    if (product.photoUrl == null) {
      return Image.asset(
        'assets/images/no-image.png',
        height: 250,
      );
    } else {
      return FadeInImage(
        height: 250,
        image: NetworkImage(product.photoUrl),
        placeholder: AssetImage('assets/images/jar-loading.gif'),
      );
    }
  }

  Widget _buildListTile(BuildContext context, Product product) {
    return ListTile(
      title: Text('${product.title} - ${product.value}'),
      subtitle: Text(product.id),
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routeName, arguments: product);
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushNamed(context, ProductPage.routeName);
        });
  }
}
