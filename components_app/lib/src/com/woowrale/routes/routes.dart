import 'package:flutter/material.dart';

import 'package:components/src/com/woowrale/pages/alert_page.dart';
import 'package:components/src/com/woowrale/pages/avatar_page.dart';
import 'package:components/src/com/woowrale/pages/card_page.dart';
import 'package:components/src/com/woowrale/pages/home_page.dart';
import 'package:components/src/com/woowrale/pages/inputs_page.dart';
import 'package:components/src/com/woowrale/pages/animated_container.dart';
import 'package:components/src/com/woowrale/pages/slider_page.dart';
import 'package:components/src/com/woowrale/pages/listview_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimaterContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'listview': (BuildContext context) => ListViewPage(),
  };
}
