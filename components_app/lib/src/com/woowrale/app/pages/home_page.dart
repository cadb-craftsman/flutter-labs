import 'package:flutter/material.dart';

import 'package:components/src/com/woowrale/app/providers/menu_provider.dart';
import 'package:components/src/com/woowrale/app/utils/icons_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return FutureBuilder(
      future: menuProviver.loadData(),
      initialData: [],
      //ignore:, missing_return
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //if (snapshot.hasData) {
        return ListView(
          children: _buildListItems(snapshot.data, context),
        );
        //}
      },
    );
  }

  List<Widget> _buildListItems(List<dynamic> options, BuildContext context) {
    final List<Widget> widgetLits = new List<Widget>();

    //for (dynamic option in options) {
    options.forEach((option) {
      widgetLits.add(new ListTile(
        title: Text(option['text']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
        onTap: () {
          Navigator.pushNamed(context, option['path']);
          /*
          Navigator.pushNamed(context, '/${option['path']}');
          final route = MaterialPageRoute(
            builder: (context){
              return AlertPage();
            }
          );
          Navigator.push(context, route);
           */
        },
      ));
      widgetLits.add(Divider());
    });

    return widgetLits;
  }
}
