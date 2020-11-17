import 'package:flutter/material.dart';
import 'package:usersettings_app/src/presentation/widgets/menu_drawer_widget.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MenuDrawerWidget(),
      body: Column(
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
