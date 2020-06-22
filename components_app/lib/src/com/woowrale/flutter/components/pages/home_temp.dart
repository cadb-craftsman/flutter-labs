import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final options = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComponentsTemp App Bar'),
      ),
      body: ListView(
          //children: _createItems()
          children: _createItemsMap()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> widgetList = new List<Widget>();

    for (String opt in options) {
      ListTile widget = ListTile(
        title: Text(opt),
      );
      widgetList.add(widget);
      widgetList.add(Divider());
    }
    return widgetList;
  }

  List<Widget> _createItemsMap() {
    var widgets = options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle $item'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
        ],
      );
    }).toList();
    return widgets;
  }
}
