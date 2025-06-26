import 'package:get_it/get_it.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/local_data_source.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/remote_data_source.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';
import 'package:your_tour_guide/features/favourite/domain/repos/favourite_repo_impl.dart';
import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/domain/repos/feature_repo_impl.dart';
import 'package:your_tour_guide/features/places/domian/repos/places_repo_impl.dart';

import '../../features/cities/data/repos/city_repo.dart';
import '../../features/cities/domain/repos/city_repo_impl.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  //------------------------------------------------------------------
  //DataSources
  getIt.registerSingleton<FavouriteRemoteDataSource>(
      FavouriteRemoteDataSource(getIt<DatabaseServices>()));
  getIt.registerSingleton<FavouriteLocalDataSource>(FavouriteLocalDataSource());
  //------------------------------------------------------------------
  //Repos
  getIt
      .registerSingleton<PlacesRepo>(PlacesRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<CityRepo>(CityRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<FeaturesRepo>(
    FeatureRepoImpl(
      getIt<DatabaseServices>(),
    ),
  );
  getIt.registerSingleton<FavouriteRepo>(
    FavouriteRepoImpl(
      getIt<FavouriteRemoteDataSource>(),
      getIt<FavouriteLocalDataSource>(),
    ),
  );
}
