import 'package:flutter/material.dart';
import 'package:usersettings_app/src/domain/SettingsUser.dart';
import 'package:usersettings_app/src/presentation/widgets/menu_drawer_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final settingsUser = new SettingsUser();

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
          Text('Secondary Color: ${settingsUser.secondaryColor}'),
          Divider(),
          Text('Genre: ${settingsUser.genre}'),
          Divider(),
          Text('Name: ${settingsUser.name}'),
          Divider(),
        ],
      ),
    );
  }
}
