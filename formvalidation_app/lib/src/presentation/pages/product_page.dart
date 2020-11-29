import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static final String routeName = 'product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        actions: [
          _buildIconButton(Icons.photo_size_select_actual, () {}),
          _buildIconButton(Icons.camera_alt, () {}),
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
        child: Column(
      children: [
        _buildName(),
        _buildPrice(),
        _buildRaisedButton(),
      ],
    ));
  }

  Widget _buildName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product:'),
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price:'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }

  Widget _buildRaisedButton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        label: Text('Save'),
        icon: Icon(Icons.save),
        onPressed: () {});
  }
}
