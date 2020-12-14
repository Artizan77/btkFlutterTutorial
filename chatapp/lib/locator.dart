import 'package:chatapp/repository/user_repository.dart';
import 'package:chatapp/services/fake_auth_service.dart';
import 'package:chatapp/services/firebase_auth_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => UserRepository());
}
