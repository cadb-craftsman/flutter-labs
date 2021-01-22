import 'dart:convert';

import 'package:formvalidation_app/src/core/settings/user_settings.dart';
import 'package:http/http.dart' as http;
import 'package:formvalidation_app/src/features/data/remote/models/user_model.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_users_provider.dart';

class UsersProvider implements ApiUsersProvider {
  final String url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDtTc-LTNSFUiYsvgxsxI6WtFPNrr7ackk';

  final String urlLogin =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDtTc-LTNSFUiYsvgxsxI6WtFPNrr7ackk';

  final UserSettings _settings = new UserSettings();

  @override
  Future<UserTokenModel> register(UserModel user) async {
    UserTokenModel _userTokenModel;

    final Map<String, dynamic> decodeResp = await _buildPostRequest(user, url);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _settings.token = decodeResp['idToken'];
      _userTokenModel = new UserTokenModel(
          idToken: decodeResp['idToken'],
          message: 'El usuario se ha registrado correctamente',
          isOk: true);
    } else {
      _userTokenModel = new UserTokenModel(
          idToken: '', message: 'The user already exist.', isOk: false);
    }
    return _userTokenModel;
  }

  @override
  Future<UserTokenModel> login(UserModel user) async {
    UserTokenModel _userTokenModel;
    final Map<String, dynamic> decodeResp =
        await _buildPostRequest(user, urlLogin);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _settings.token = decodeResp['idToken'];
      _userTokenModel = new UserTokenModel(
          idToken: decodeResp['idToken'],
          message: 'El usuario se ha logado correctamente',
          isOk: true);
    } else {
      _userTokenModel = new UserTokenModel(
          idToken: '', message: 'User or Password is incorrect.', isOk: false);
    }
    return _userTokenModel;
  }

  Future<Map<String, dynamic>> _buildPostRequest(
      UserModel user, String url) async {
    final authData = {
      'email': user.email,
      'password': user.password,
      'returnSecureToken ': true
    };

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(response.body);

    return decodeResp;
  }
}
