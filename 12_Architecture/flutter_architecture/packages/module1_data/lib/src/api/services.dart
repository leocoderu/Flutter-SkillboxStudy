import 'package:module1_model/module1_model.dart';

abstract class UserService{
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}