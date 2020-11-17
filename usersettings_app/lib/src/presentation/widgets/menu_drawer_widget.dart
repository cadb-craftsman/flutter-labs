import 'package:flutter/material.dart';
import 'package:usersettings_app/src/presentation/pages/home_page.dart';
import 'package:usersettings_app/src/presentation/pages/settings_page.dart';

class MenuDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDrawer(context);
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildListTile(Icons.pages, 'Pages', () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }),
          _buildListTile(Icons.people, 'People', () {}),
          _buildListTile(Icons.movie, 'Movies', () {}),
          _buildListTile(Icons.settings, 'Settings', () {
            Navigator.pushReplacementNamed(context, SettingsPage.routeName);
          }),
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/original.jpg'),
              fit: BoxFit.cover)),
    );
  }

  ListTile _buildListTile(IconData icon, String text, Function() funcOnTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      onTap: funcOnTap,
    );
  }
}
