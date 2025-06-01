import 'package:your_tour_guide/core/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/domain/entities/place_entity.dart';
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/home_view.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/nav_bar/presentation/views/favourite/all_favourite.dart';
import '../../features/nav_bar/presentation/views/profile/profile_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.placeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final PlacesRepo placeRepo;

//-----------------------Get Featured Places ----------------------------------------------
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

//---------------------------- language -----------------------------------------

  Locale? locale;

  void getSavedLanguage() {
    final cachedLanguageCode = CacheData.getCachedLanguage();
    locale = Locale(cachedLanguageCode);
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheData.cacheLanguage(languageCode);
    locale = Locale(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }

  //----------------------------- BottomNavBar ----------------------------------------
  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  //------------------------------ Theme ---------------------------------------
  bool? isDark;
  Future<void> changeThemeMode(bool isDarkk) async {
    isDark = isDarkk;
    isDark = !isDark!;
    bool savedValue = isDark!;
    isDark = savedValue;
    await CacheData.cacheTheme(savedValue);
    emit(HomeChangeTheme());
  }

  void getSavedTheme() {
    final cachedTheme = CacheData.getCachedTheme();
    print('this is saved isDark value $cachedTheme');
    isDark = cachedTheme;
    print('this is isDark value when app is initialized : $isDark');
    emit(HomeChangeTheme());
  }

  //---------------------------------------------------------------------
  Future<void> facebookLogOut() async {
    await FacebookAuth.instance.logOut();
    print('logged out successfully from facebook');
    emit(HomeFacebookSignOut());
  }

  Future<void> emailLogOut() async {
    await FirebaseAuth.instance.signOut();
    print('logged out successfully from email');
    emit(HomeEmailSignOut());
  }

  Future<void> googleLogOut() async {
    await GoogleSignIn().signOut();
    print('logged out successfully from google');
    emit(HomeGoogleSignOut());
  }

  //---------------------------------------------------------------------
  static String collectionName = '';
  static String? collectionNameAfter;
  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    AllFavouriteView(),
    ProfileView(),
  ];
  final List<IconData> iconList = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.search,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.user,
  ];
  final List<String> searchAbout = [
    'hotels',
    'malls',
    'places',
    'mosques',
    'cinemas',
    'cafes',
    'churchs',
    'cities',
    'restaurants',
  ];
  final List<String> searchAboutArabic = [
    'Hotels',
    'Malls',
    'Places',
    'Mosques',
    'Cinemas',
    'Cafes',
    'Churches',
    'cities',
    'Restaurants',

    // S.current.Hotels,
    // S.current.Malls,
    // S.current.Places,
    // S.current.Mosques,
    // S.current.Cinemas,
    // S.current.Cafes,
    // S.current.Churches,
    // S.current.cities,
    // S.current.Restaurants,
  ];

  void changeCollectionName(int index) {
    collectionName = searchAbout[index];
    collectionNameAfter = collectionName;
    print('this is collection name with cubit function $collectionName');
    emit(HomeChangeCollectionName());
  }

  void pop(context) {
    Navigator.pop(context, collectionName);
    emit(HomeUpdateUi());
    print('this is collectionName when pop $collectionName');
  }

  void updateUi() {
    emit(HomeUpdateUi());
  }
//---------------------------------------------------------------------
}
