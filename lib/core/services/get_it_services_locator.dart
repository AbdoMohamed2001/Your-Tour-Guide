import 'package:get_it/get_it.dart';

import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  // getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
  //   firebaseAuthService: getIt<FirebaseAuthService>(),
  //   databaseServices: getIt<DatabaseServices>(),
  // ));
}
