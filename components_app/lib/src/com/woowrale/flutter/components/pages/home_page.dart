import 'package:flutter/material.dart';

import 'package:app/src/com/woowrale/flutter/components/providers/menu_provider.dart';

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
    print(menuProviver.options);
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
