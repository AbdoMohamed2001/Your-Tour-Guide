import 'package:get_it/get_it.dart';
import 'package:your_tour_guide/core/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/domain/repos/places_repo_impl.dart';

import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<PlacesRepo>(PlacesRepoImpl(
    getIt<DatabaseServices>(),
  ));
  // getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
  //   firebaseAuthService: getIt<FirebaseAuthService>(),
  //   databaseServices: getIt<DatabaseServices>(),
  // ));
}
