import 'package:flutter/material.dart';

import 'package:app/src/com/woowrale/components/pages/home_page.dart';

void main() => runApp(ComponentApp());

class ComponentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      home: HomePage()
    );
  }
}
