import 'package:flutter/material.dart';
import 'package:newsprovider_app/src/news/presentation/bloc/new_service.dart';
import 'package:newsprovider_app/src/news/presentation/pages/tabs_page.dart';
import 'package:newsprovider_app/src/news/presentation/theme/dark_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Provider App',
        theme: darkTheme,
        home: TabsPage(),
      ),
    );
  }
}
