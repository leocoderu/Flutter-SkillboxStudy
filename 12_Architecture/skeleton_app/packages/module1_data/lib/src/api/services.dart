import 'package:module1_model/module1_model.dart';

abstract class HealthService{
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}

abstract class UserService{
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}