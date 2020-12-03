import 'dart:convert';

import 'package:flutter/services.dart';

class _LoadProperties {
  dynamic option = '';
  List<dynamic> options = [];

  _LoadProperties();

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('assets/data/environment.json');
    Map dataMap = json.decode(data);
    options = dataMap['urlBase'];
    return options;
  }

  Future<dynamic> loadDataByKey(String keyMap) async {
    final data = await rootBundle.loadString('assets/data/environment.json');
    Map dataMap = json.decode(data);
    option = dataMap[keyMap];
    return option;
  }
}

final properties = new _LoadProperties();
