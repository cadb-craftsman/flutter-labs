
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/com/woowrale/pages/alert_page.dart';
import 'package:components/src/com/woowrale/routes/routes.dart';

void main() => runApp(ComponentApp());

class ComponentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
