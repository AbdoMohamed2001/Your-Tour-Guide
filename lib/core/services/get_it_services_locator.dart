import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/features/cinemas/data/repos/cinema_repo.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/repos/cafe_repo_impl.dart';
import 'package:your_tour_guide/features/churchs/data/repos/church_repo.dart';
import 'package:your_tour_guide/features/churchs/domain/repos/church_repo_impl.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/local_data_source.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/remote_data_source.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';
import 'package:your_tour_guide/features/favourite/domain/repos/favourite_repo_impl.dart';
import 'package:your_tour_guide/features/hotels/data/repos/hotels_repo.dart';
import 'package:your_tour_guide/features/hotels/domain/repos/hotels_repo_impl.dart';
import 'package:your_tour_guide/features/malls/data/repos/mall_repo.dart';
import 'package:your_tour_guide/features/mosques/data/repos/mosque_repo.dart';
import 'package:your_tour_guide/features/mosques/domain/repos/mosque_repo_impl.dart';
import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/domain/repos/feature_repo_impl.dart';
import 'package:your_tour_guide/features/places/domian/repos/places_repo_impl.dart';
import 'package:your_tour_guide/features/restaurants/data/repos/restaurant_repo.dart';
import 'package:your_tour_guide/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:your_tour_guide/features/search/data/repos/search_repo.dart';
import 'package:your_tour_guide/features/search/domain/repos/search_repo_impl.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/search_collections_usecase.dart';

import '../../features/cinemas/domain/repos/cinema_repo_impl.dart';
import '../../features/cities/data/repos/city_repo.dart';
import '../../features/cities/domain/repos/city_repo_impl.dart';
import '../../features/malls/domain/repos/mall_repo_impl.dart';
import '../../features/restaurants/domain/repos/rest_repo_impl.dart';
import '../../features/search/domain/use_cases/get_search_suggestion_usecase.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  //------------------------------------------------------------------
  //DataSources
  getIt.registerSingleton<FavouriteRemoteDataSource>(
      FavouriteRemoteDataSource(getIt<DatabaseServices>()));
  getIt.registerSingleton<FavouriteLocalDataSource>(FavouriteLocalDataSource());
  getIt.registerSingleton<SearchRemoteDataSource>(
      SearchRemoteDataSourceImpl(databaseServices: getIt<DatabaseServices>()));
  //------------------------------------------------------------------
  //Repos
  getIt.registerSingleton<SearchRepo>(
      SearchRepositoryImpl(remoteDataSource: getIt<SearchRemoteDataSource>()));
  getIt
      .registerSingleton<PlacesRepo>(PlacesRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<CafeRepo>(CafeRepoImpl(getIt<DatabaseServices>()));
  getIt
      .registerSingleton<HotelsRepo>(HotelsRepoImpl(getIt<DatabaseServices>()));
  getIt
      .registerSingleton<MosqueRepo>(MosqueRepoImpl(getIt<DatabaseServices>()));
  getIt
      .registerSingleton<CinemaRepo>(CinemaRepoImpl(getIt<DatabaseServices>()));
  getIt
      .registerSingleton<ChurchRepo>(ChurchRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<MallRepo>(MallRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<RestaurantRepo>(
      RestaurantsRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<CityRepo>(CityRepoImpl(getIt<DatabaseServices>()));
  getIt.registerSingleton<FeaturesRepo>(
    FeatureRepoImpl(getIt<DatabaseServices>()),
  );
  getIt.registerSingleton<FavouriteRepo>(
    FavouriteRepoImpl(
      getIt<FavouriteRemoteDataSource>(),
      getIt<FavouriteLocalDataSource>(),
    ),
  );

  //---------------------------------------------------------------------
  //UseCases
  getIt.registerSingleton<SearchAcrossCollectionsUseCase>(
    SearchAcrossCollectionsUseCase(getIt<SearchRepo>()),
  );
  getIt.registerSingleton<GetSearchSuggestionsUseCase>(
    GetSearchSuggestionsUseCase(getIt<SearchRepo>()),
  );
}
