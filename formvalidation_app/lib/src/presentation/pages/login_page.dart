import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/presentation/widgets/background_widget.dart';
import 'package:formvalidation_app/src/presentation/widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  static final routeName = 'login';

  final _backgroundWidget = BackgroundWidget();
  final _loginFormWidget = LoginFormWidget();

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
        _loginFormWidget,
      ],
    );
  }
}
