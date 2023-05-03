import 'package:get_it/get_it.dart';
import 'package:firebase_project/view_controller/auth_repo.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
}