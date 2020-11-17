import 'package:flutter/material.dart';
import 'package:usersettings_app/src/presentation/widgets/menu_drawer_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: MenuDrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario'),
          Divider(),
          Text('Color Secundario'),
          Divider(),
          Text('Color Secundario'),
          Divider(),
        ],
      ),
    );
  }
}
