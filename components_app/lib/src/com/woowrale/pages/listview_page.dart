import 'dart:async';
import 'dart:wasm';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int _lastItem = 0;
  bool _isLoading = false;
  List<int> _numberList = new List();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _addMoreElements();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addMoreElements();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView & Scrolls'),
        ),
        body: Stack(
          children: [
            _createListViews(),
            _createLoading(),
          ],
        ));
  }

  Widget _createListViews() {
    return RefreshIndicator(child: ListView.builder(
      controller: _scrollController,
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _numberList[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
        );
      },
    ), onRefresh: getFirtsPage);
  }

  Future<Null> getFirtsPage() {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _addMoreElements();
    });

    return Future.delayed(duration);
  }

  void _addMoreElements() {
    for (int i = 0; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    new Timer(Duration(seconds: 2), responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addMoreElements();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
