import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/features/presentation/widgets/background_widget.dart';
import 'package:formvalidation_app/src/features/presentation/widgets/register_form_widget.dart';

class RegisterPage extends StatelessWidget {
  static final routeName = 'register';


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _backgroundWidget = BackgroundWidget();
  final _registerFormWidget = RegisterFormWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildStack(context),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        _backgroundWidget,
        _registerFormWidget,
      ],
    );
  }
}
