import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  MenuProvider() {}

  loadData(){
    rootBundle.loadString('data/menu_opts.json').then((data){
      print(data);
    });
  }
}

final menuProviver = new _MenuProvider();
