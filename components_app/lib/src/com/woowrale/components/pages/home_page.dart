import 'package:flutter/material.dart';

import 'package:app/src/com/woowrale/components/utils/icons_utils.dart';
import 'package:app/src/com/woowrale/components/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Components'),
          ),
          body: _buildWidgetList()),
    );
  }

  Widget _buildWidgetList() {
    return FutureBuilder(
      future: menuProviver.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _buildListItems(snapshot.data),
          );
        }
      },
    );
  }

  List<Widget> _buildListItems(List<dynamic> options) {
    final List<Widget> widgetLits = new List<Widget>();

    for (dynamic option in options) {
      widgetLits.add(new ListTile(
        title: Text(option['text']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
        onTap: () {},
      ));
      widgetLits.add(Divider());
    }

    return widgetLits;
  }
}
