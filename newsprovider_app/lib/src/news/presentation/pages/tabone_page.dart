import 'package:flutter/material.dart';
import 'package:newsprovider_app/src/news/presentation/bloc/new_service.dart';
import 'package:newsprovider_app/src/news/presentation/widgets/news.dart';
import 'package:provider/provider.dart';

class TabOnePage extends StatefulWidget {
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    return Scaffold(
      body: (newService.headLines.length == 0)
          ? Center(child: CircularProgressIndicator())
          : News(newService.headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
