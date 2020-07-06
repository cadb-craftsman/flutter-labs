import 'package:flutter/material.dart';

import 'package:components/src/com/woowrale/app/pages/alert_page.dart';
import 'package:components/src/com/woowrale/app/pages/avatar_page.dart';
import 'package:components/src/com/woowrale/app/pages/home_page.dart';
import 'package:components/src/com/woowrale/app/pages/card_page.dart';

Map<String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}