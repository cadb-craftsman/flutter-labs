import 'package:formvalidation_app/src/features/data/remote/models/user_model.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';

UserModel userToUserModel(User user) {
  return new UserModel(email: user.email, password: user.password);
}

UserToken userTokenModelToUserToken(UserTokenModel userTokenModel) {
  return UserToken(
      idToken: userTokenModel.idToken,
      message: userTokenModel.message,
      isOk: userTokenModel.isOk);
}
