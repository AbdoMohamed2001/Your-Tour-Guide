import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:your_tour_guide/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:your_tour_guide/core/cubits/theme/theme_cubit.dart';
import 'package:your_tour_guide/core/services/firebase_storage_services.dart';
import 'package:your_tour_guide/core/services/storage_services.dart';
import 'package:your_tour_guide/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:your_tour_guide/features/auth/domain/repos/auth_repo_impl.dart';
import 'package:your_tour_guide/features/auth/data/repos/auth_repo.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/auth_usecase.dart';
import 'package:your_tour_guide/features/cafes/data/datasources/cafes_remote_data_source.dart';
import 'package:your_tour_guide/features/cinemas/domain/repos/cinema_repo.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/repos/cafe_repo_impl.dart';
import 'package:your_tour_guide/features/churchs/data/repos/church_repo.dart';
import 'package:your_tour_guide/features/churchs/domain/repos/church_repo_impl.dart';
import 'package:your_tour_guide/features/events/data/datasources/event_remote_data_source.dart';
import 'package:your_tour_guide/features/events/domain/repos/event_repo_impl.dart';
import 'package:your_tour_guide/features/events/data/repos/event_repo.dart';
import 'package:your_tour_guide/features/events/domain/usecases/get_events_usecase.dart';
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
import 'package:your_tour_guide/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:your_tour_guide/features/profile/domain/repos/profile_repo.dart';
import 'package:your_tour_guide/features/profile/domain/usecases/profile_usecase.dart';
import 'package:your_tour_guide/features/restaurants/data/repos/restaurant_repo.dart';
import 'package:your_tour_guide/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:your_tour_guide/features/search/data/repos/search_repo.dart';
import 'package:your_tour_guide/features/search/domain/repos/search_repo_impl.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/get_entity_from_search_usecase.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/search_collections_usecase.dart';
import 'package:your_tour_guide/features/tours/data/datasources/tour_remote_data_source.dart';
import 'package:your_tour_guide/features/tours/domain/repos/tour_repo.dart';
import 'package:your_tour_guide/features/tours/domain/usecases/get_tours_usecase.dart';

import '../../features/auth/data/datasources/local/auth_local_datasource.dart';
import '../../features/cinemas/data/repos/cinema_repo_impl.dart';
import '../../features/cities/data/repos/city_repo.dart';
import '../../features/cities/domain/repos/city_repo_impl.dart';
import '../../features/feature_details/data/repos/features_repo.dart';
import '../../features/feature_details/domain/repos/feature_repo_impl.dart';
import '../../features/malls/domain/repos/mall_repo_impl.dart';
import '../../features/places/domain/repos/places_repo_impl.dart';
import '../../features/profile/data/datasources/profile_local_data_source.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/restaurants/domain/repos/rest_repo_impl.dart';
import '../../features/search/domain/use_cases/get_search_suggestion_usecase.dart';
import '../../features/tours/data/repos/tour_repo_impl.dart';
import '../cubits/home/home_cubit.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // STEP 1: Register Services (Foundation Layer)
  _registerServices();

  // STEP 2: Register DataSources (Data Access Layer)
  _registerDataSources();

  // STEP 3: Register Repositories (Data Layer)
  _registerRepositories();

  // STEP 4: Register Use Cases (Domain Layer)
  _registerUseCases();

  // STEP 5: Register Cubits/Blocs (Presentation Layer)
  _registerCubits();
}

void _registerServices() {
  // Core services that other services depend on
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<StorageServices>(FirebaseStorageServices());

  // Network service
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.instance,
  );
}

void _registerDataSources() {
  // Remote data sources
  getIt.registerSingleton<ProfileRemoteDataSource>(
    ProfileRemoteDataSourceImpl(
      getIt<FirebaseAuthService>(),
      getIt<DatabaseServices>(),
      getIt<StorageServices>(),
    ),
  );
  getIt.registerSingleton<FavouriteRemoteDataSource>(
      FavouriteRemoteDataSource(getIt<DatabaseServices>()));
  getIt.registerSingleton<SearchRemoteDataSource>(
      SearchRemoteDataSourceImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerSingleton<EventRemoteDataSource>(
      EventRemoteDataSourceImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerSingleton<TourRemoteDataSource>(
      TourRemoteDataSourceImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerSingleton<CafesRemoteDataSource>(
      CafesRemoteDataSourceImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(
      getIt<FirebaseAuthService>(), getIt<DatabaseServices>()));

  // Local data sources
  getIt.registerSingleton<ProfileLocalDataSource>(ProfileLocalDataSourceImpl());
  getIt.registerSingleton<FavouriteLocalDataSource>(FavouriteLocalDataSource());
  getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
}

void _registerRepositories() {
  // Register repositories in order of dependency
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(
    getIt<ProfileRemoteDataSource>(),
    getIt<ProfileLocalDataSource>(),
  ));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    getIt<AuthRemoteDataSource>(),
    getIt<AuthLocalDataSource>(),
  ));
  getIt.registerSingleton<SearchRepo>(
      SearchRepositoryImpl(remoteDataSource: getIt<SearchRemoteDataSource>()));

  // This is the important one - PlacesRepo must be registered before HomeCubit
  getIt
      .registerSingleton<PlacesRepo>(PlacesRepoImpl(getIt<DatabaseServices>()));

  getIt.registerSingleton<CafeRepo>(
      CafeRepoImpl(getIt<CafesRemoteDataSource>()));
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
  getIt.registerSingleton<EventRepo>(
      EventRepoImpl(getIt<EventRemoteDataSource>()));
  getIt
      .registerSingleton<TourRepo>(TourRepoImpl(getIt<TourRemoteDataSource>()));
  getIt.registerSingleton<FeaturesRepo>(
    FeatureRepoImpl(getIt<DatabaseServices>()),
  );
  getIt.registerSingleton<FavouriteRepo>(
    FavouriteRepoImpl(
      getIt<FavouriteRemoteDataSource>(),
      getIt<FavouriteLocalDataSource>(),
    ),
  );
}

void _registerUseCases() {
  getIt.registerSingleton<GetToursUseCase>(
    GetToursUseCase(getIt<TourRepo>()),
  );
  getIt.registerSingleton<GetEventsUseCase>(
    GetEventsUseCase(getIt<EventRepo>()),
  );
  getIt.registerSingleton<ProfileUseCase>(
    ProfileUseCaseImpl(getIt<ProfileRepo>()),
  );
  getIt.registerSingleton<SearchAcrossCollectionsUseCase>(
    SearchAcrossCollectionsUseCase(getIt<SearchRepo>()),
  );
  getIt.registerSingleton<GetSearchSuggestionsUseCase>(
    GetSearchSuggestionsUseCase(getIt<SearchRepo>()),
  );
  getIt.registerSingleton<GetEntityFromSearchUseCase>(
    GetEntityFromSearchUseCase(getIt<SearchRepo>()),
  );
  getIt.registerSingleton<AuthUseCase>(
    AuthUseCaseImpl(getIt<AuthRepo>()),
  );
}

void _registerCubits() {
  // Register HomeCubit LAST, after all its dependencies (especially PlacesRepo) are registered
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<PlacesRepo>()),
  );
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
  );
  getIt.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(),
  );

  // Add other Cubits/Blocs here as needed
}

// Optional: Method to reset GetIt (useful for testing)
void resetGetIt() {
  getIt.reset();
}

// Optional: Method to dispose specific services when app closes
Future<void> disposeServices() async {
  // Dispose cubits properly
  if (getIt.isRegistered<HomeCubit>()) {
    await getIt<HomeCubit>().close();
    getIt.unregister<HomeCubit>();
  }

  // Add disposal for other services that need cleanup
}
