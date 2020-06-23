import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: buildWidgetList()
      ),
    );
  }

  buildWidgetList() {
    return ListView(
      children: _buildListItems(),
    );
  }

  List<Widget> _buildListItems(){
    return [
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
    ];
  }
}
