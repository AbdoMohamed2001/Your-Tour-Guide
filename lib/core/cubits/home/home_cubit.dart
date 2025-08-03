import 'dart:developer';

import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../features/favourite/presentation/views/favourites.dart';
import '../../../features/profile/presentation/views/profile_view.dart';
import '../../../features/search/presentation/views/search_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.placeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final PlacesRepo placeRepo;
  // App initialization
  Future<void> initializeApp() async {
    await getSavedTheme();
    await getSavedLanguage();
    await getFeaturedPlaces();
  }

  //-----------------------------------------------------------------------------
  // FEATURED PLACES
  //-----------------------------------------------------------------------------
  List<PlaceEntity> featuredPlaces = [];
  getFeaturedPlaces() async {
    emit(HomeGetFeaturedPlacesLoading());
    var result = await placeRepo.getFeaturedPlaces();
    result.fold(
      (failure) {
        emit(HomeGetFeaturedPlacesFailure(message: failure.message));
      },
      (places) {
        featuredPlaces = places;
        emit(HomeGetFeaturedPlacesSuccess(places: places));
      },
    );
  }

  //-----------------------------------------------------------------------------
  // LOCALIZATION
  //-----------------------------------------------------------------------------
  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;

  Future<void> getSavedLanguage() async {
    emit(ChangeLocaleLoading());
    try {
      final cachedLanguageCode = CacheData.getCachedLanguage();
      _currentLocale = Locale(cachedLanguageCode);
      emit(ChangeLocaleSuccess(locale: Locale(cachedLanguageCode)));
    } catch (e) {
      log('Error while trying to get local language ${e.toString()}');
      emit(ChangeLocaleFailure(
          message: 'Error while trying to get local language'));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_currentLocale.languageCode == languageCode) return;
    emit(ChangeLocaleLoading());
    try {
      await CacheData.cacheLanguage(languageCode);
      await Future.delayed(const Duration(milliseconds: 300));
      _currentLocale = Locale(languageCode);
      emit(ChangeLocaleSuccess(locale: Locale(languageCode)));
    } catch (e) {
      log('Error changing language ${e.toString()}');
      emit(ChangeLocaleFailure(
          message: 'Error while trying to change local language'));
    }
  }

  //-----------------------------------------------------------------------------
  // THEME MANAGEMENT
  //-----------------------------------------------------------------------------
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  ThemeMode get currentThemeMode =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  Future<void> getSavedTheme() async {
    try {
      _isDarkMode = CacheData.getCachedTheme();
      emit(HomeChangeTheme());
    } catch (e) {
      log('Error loading saved theme: ${e.toString()}');
      _isDarkMode = false;
      emit(HomeChangeTheme());
    }
  }

  Future<void> toggleTheme() async {
    try {
      _isDarkMode = !_isDarkMode;
      await CacheData.cacheTheme(_isDarkMode);
      emit(HomeChangeTheme());
    } catch (e) {
      log('Error toggling theme: ${e.toString()}');
      // Revert the change if caching fails
      _isDarkMode = !_isDarkMode;
    }
  }

//----------------------------- BottomNavBar
  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    FavouritesView(),
    ProfileView(),
  ];
  final List<IconData> iconList = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.search,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.user,
  ];

//---------------------------------------------------------------------
}
