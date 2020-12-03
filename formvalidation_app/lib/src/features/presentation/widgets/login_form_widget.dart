import 'package:flutter/material.dart';
import 'package:formvalidation_app/src/features/presentation/bloc/login_bloc.dart';
import 'package:formvalidation_app/src/features/presentation/bloc/provider.dart';
import 'package:formvalidation_app/src/features/presentation/pages/home_page.dart';

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSingleChildScrollView(context);
  }

  Widget _buildSingleChildScrollView(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 200.0)),
          _buildContainerForm(size, bloc),
          _buildTitleText('Forgot Password?'),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _buildContainerForm(Size size, LoginBloc bloc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      margin: EdgeInsets.symmetric(vertical: 30.0),
      width: size.width * 0.85,
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          _buildTitleText('Insert Data'),
          SizedBox(height: 20.0),
          _buildEmail(bloc),
          SizedBox(height: 20.0),
          _buildPassword(bloc),
          SizedBox(height: 20.0),
          _buildRaiseButton(bloc),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 3.0,
              offset: Offset(0.0, 5.0),
              spreadRadius: 3.0)
        ]);
  }

  Widget _buildTitleText(String text) {
    return Text(text);
  }

  Widget _buildEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: _buildEmailDecorattion(snapshot.data, snapshot.error),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  InputDecoration _buildEmailDecorattion(String data, String error) {
    return InputDecoration(
        icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
        hintText: 'example@email.com',
        labelText: 'Email',
        counterText: data,
        errorText: error);
  }

  Widget _buildPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration:
                  _buildPasswordDecoration(snapshot.data, snapshot.error),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  InputDecoration _buildPasswordDecoration(String data, String error) {
    return InputDecoration(
        icon: Icon(Icons.lock, color: Colors.deepPurple),
        labelText: 'Password',
        counterText: data,
        errorText: error);
  }

  Widget _buildRaiseButton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
            child: RaisedButton(
                child: Text('Login'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                color: Colors.deepPurple,
                textColor: Colors.white,
                onPressed: snapshot.hasData
                    ? () {
                        _onPressButton(context, bloc);
                      }
                    : null),
          );
        });
  }

  _onPressButton(BuildContext context, LoginBloc bloc) {
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    Navigator.pushNamed(context, HomePage.routeName);
  }
}
