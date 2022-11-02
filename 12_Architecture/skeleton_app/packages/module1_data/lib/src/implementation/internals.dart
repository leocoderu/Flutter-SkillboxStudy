import 'package:injectable/injectable.dart';
import 'package:module1_data/module1_data.dart';
import 'package:module1_model/module1_model.dart';

@LazySingleton(as: UserService)
class DummyUserService implements UserService {

  @override
  Future<UserData> getDefaultUser() async {
    await Future.delayed(
        const Duration(seconds: 1),
    );
    return const UserData(id: 1, name: 'Default');
  }

  @override
  Future<UserData> getUserById(int id) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return UserData(id: id, name: 'Specific User number $id');
  }
}