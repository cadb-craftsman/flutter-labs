import 'package:flutter/material.dart';

import 'package:components/src/com/woowrale/pages/alert_page.dart';
import 'package:components/src/com/woowrale/pages/avatar_page.dart';
import 'package:components/src/com/woowrale/pages/card_page.dart';
import 'package:components/src/com/woowrale/pages/home_page.dart';

Map<String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}