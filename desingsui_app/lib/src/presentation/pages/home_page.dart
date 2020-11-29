import 'package:desingsui_app/src/presentation/widgets/header_curve.dart';
import 'package:desingsui_app/src/presentation/widgets/header_diagonal.dart';
import 'package:desingsui_app/src/presentation/widgets/header_pick.dart';
import 'package:desingsui_app/src/presentation/widgets/header_rounded.dart';
import 'package:desingsui_app/src/presentation/widgets/header_square.dart';
import 'package:desingsui_app/src/presentation/widgets/header_triangle.dart';
import 'package:desingsui_app/src/presentation/widgets/header_waves.dart';
import 'package:desingsui_app/src/presentation/widgets/header_waves_gradient.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: HeaderSquare(),
      //body: HeaderRounded(),
      //body: HeaderTriangle(),
      //body: HeaderPick(),
      //body: HeaderCurve(),
      //body: HeaderWaves(),
      body: HeaderWavesGradient(),
    );
  }
}
