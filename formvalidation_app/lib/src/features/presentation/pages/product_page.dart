import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:formvalidation_app/src/core/utils/utils.dart' as utils;
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/presentation/bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  static final String routeName = 'product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  File _image;
  final picker = ImagePicker();

  Product product;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductBloc _productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    product = _loadProduct(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product Page'),
        backgroundColor: Colors.deepPurple,
        actions: [
          _buildIconButton(Icons.photo_size_select_actual, selectPicture),
          _buildIconButton(Icons.camera_alt, takePicture),
        ],
      ),
      body: _buildSingleScrollView(),
    );
  }

  Widget _buildIconButton(IconData icon, Function function) {
    return IconButton(
      icon: Icon(icon),
      onPressed: function,
    );
  }

  Widget _buildSingleScrollView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            _buildImageView(),
            _buildName(),
            _buildPrice(),
            _buildAvaliable(),
            _buildRaisedButton(),
          ],
        ));
  }

  Widget _buildImageView() {
    if (product.photoUrl != null && product.photoUrl.isNotEmpty) {
      return Container(
        child: FadeInImage(
          image: NetworkImage(product.photoUrl),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
        ),
        height: 250,
      );
    } else {
      if (_image != null) {
        return Image.file(
          _image,
          height: 250,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset('assets/images/no-image.png');
      }
    }
  }

  Widget _buildName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product:'),
      onSaved: (value) => product.title = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Insert product name';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      decoration: InputDecoration(labelText: 'Price:'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onSaved: (value) => product.value = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Insert only numbers';
        }
      },
    );
  }

  Widget _buildAvaliable() {
    return SwitchListTile(
      title: Text('Avaliable:'),
      value: product.available,
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          product.available = value;
        });
      },
    );
  }

  Widget _buildRaisedButton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        label: Text('Save'),
        icon: Icon(Icons.save),
        onPressed: () {
          _onClickSaveButton();
        });
  }

  void showSnackbar(String message) {
    final snackbar = new SnackBar(
      duration: Duration(seconds: 5),
      content: Text(message),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void _onClickSaveButton() async {
    String _secureUrl = '';
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();

    if (_image != null) {
      if (_image.path != null && _image.path.isNotEmpty) {
        _secureUrl = await _productBloc.uploadImage(_image);
      }
    }

    if (_secureUrl.isNotEmpty) {
      product.photoUrl = _secureUrl;
    }

    if (product.id.isNotEmpty) {
      _productBloc.updateProduct(product);
    } else {
      _productBloc.createProduct(product);
    }

    showSnackbar('Product saved');
    Navigator.pop(context);
  }

  Product _loadProduct(BuildContext context) {
    Product p = ModalRoute.of(context).settings.arguments;
    if (p != null) {
      return p;
    } else {
      return new Product();
    }
  }

  Future takePicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = File('assets/images/no-image.png');
      }
    });
  }

  Future selectPicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = File('assets/images/no-image.png');
      }
    });
  }
}
