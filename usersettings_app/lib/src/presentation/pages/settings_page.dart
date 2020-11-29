import 'package:flutter/material.dart';
import 'package:usersettings_app/src/domain/SettingsUser.dart';
import 'package:usersettings_app/src/presentation/widgets/menu_drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _textEditingController;
  final settingsUser = SettingsUser();

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: settingsUser.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MenuDrawerWidget(),
      body: _builListView(),
    );
  }

  ListView _builListView() {
    return ListView(
      children: [
        _buildContainer(),
        Divider(),
        _buildSwitchListTile('Color secundario', (v) {
          _setSecondaryColor(v);
        }),
        _buildRadioListTile('Masculino', 1, (v) {
          _setSelectedRadio(v);
        }),
        _buildRadioListTile('Femenino', 2, (v) {
          _setSelectedRadio(v);
        }),
        Divider(),
        _buildContainerText('Nombre', 'Nombre de la persona del telefono', (v) {
          _setTextName(v);
        }),
      ],
    );
  }

  _setSecondaryColor(bool value) {
    setState(() {
      settingsUser.secondaryColor = value;
    });
  }

  _setSelectedRadio(int value) {
    setState(() {
      settingsUser.genre = value;
    });
  }

  _setTextName(String value) {
    setState(() {
      settingsUser.name = value;
    });
  }

  Widget _buildContainer() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSwitchListTile(String title, Function funcOnChange(v)) {
    return SwitchListTile(
      value: settingsUser.secondaryColor,
      title: Text(title),
      onChanged: funcOnChange,
    );
  }

  Widget _buildRadioListTile(String text, int value, Function funcOnChange(v)) {
    return RadioListTile(
        value: value,
        title: Text(text),
        groupValue: settingsUser.genre,
        onChanged: funcOnChange);
  }

  Widget _buildContainerText(
      String labelText, String helpText, Function funcOnChange(v)) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: _textEditingController,
          decoration:
              InputDecoration(labelText: labelText, helperText: helpText),
          onChanged: funcOnChange,
        ));
  }
}
