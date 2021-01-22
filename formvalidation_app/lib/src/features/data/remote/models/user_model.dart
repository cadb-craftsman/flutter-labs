class UserModel {
  String email;
  String password;

  UserModel({this.email, this.password});
}

class UserTokenModel {
  String idToken;
  String message;
  bool isOk;

  UserTokenModel({this.idToken, this.message, this.isOk});
}
