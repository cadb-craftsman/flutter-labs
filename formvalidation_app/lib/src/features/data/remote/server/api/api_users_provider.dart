import 'package:formvalidation_app/src/features/data/remote/models/user_model.dart';

abstract class ApiUsersProvider {
  //Register a new user
  Future<UserTokenModel> register(UserModel user);

  //Login an user existent
  Future<UserTokenModel> login(UserModel user);

}
