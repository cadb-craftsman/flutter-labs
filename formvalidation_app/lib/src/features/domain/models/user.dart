class User {
  String email;
  String password;

  User({this.email = '', this.password = ''});
}

class UserToken {
  String idToken;
  String message;
  bool isOk;

  UserToken({this.idToken, this.message, this.isOk});
}
