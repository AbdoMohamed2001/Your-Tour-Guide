import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';
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

  final PlacesRepo placeRepo;
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
  // BOTTOM NAVBAR
  //-----------------------------------------------------------------------------
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
