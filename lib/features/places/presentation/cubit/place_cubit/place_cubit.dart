import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/place_entity.dart';
part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit(this.placesRepo) : super(PlaceInitial());

  final PlacesRepo placesRepo;

  List<PlaceEntity> allPlaces = [];
  List<PlaceEntity> bestPlaces = [];

  void getBestPlaces() async {
    emit(PlacesGetLoading());
    var result = await placesRepo.getFeaturedPlaces();
    result.fold(
      (fail) {
        emit(PlacesGetFailure(message: fail.message));
      },
      (places) {
        bestPlaces = places;
        emit(PlacesGetSuccess(places: bestPlaces));
      },
    );
  }

  void getPlaces({String? cityName}) async {
    emit(PlacesGetLoading());
    var result = await placesRepo.getPlaces(cityName: cityName);
    result.fold(
      (fail) {
        emit(PlacesGetFailure(message: fail.message));
      },
      (places) {
        allPlaces = places;
        emit(PlacesGetSuccess(places: allPlaces));
      },
    );
  }

  //-------------------Hotel variables -----------------------------------------
  bool hasCallSupport = false;
  bool isDescending = true;
  String order = 'cityName';
  String orderArabic = 'cityNameArabic';
//--------------------------- Sort By -----------------------------
  bool isStarsSelected = false;
  bool isRateSelected = false;
  bool isNameSelected = true;
  bool isCitySelected = false;
  void changeToName() {
    isArabic() ? orderArabic = 'nameArabic' : order = 'name';
    isStarsSelected = false;
    isRateSelected = false;
    isNameSelected = true;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }

  void changeToRate() {
    isArabic() ? orderArabic = 'rate' : order = 'rate';
    isStarsSelected = false;
    isRateSelected = true;
    isNameSelected = false;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }

  void changeToStars() {
    isArabic() ? orderArabic = 'stars' : order = 'stars';
    isStarsSelected = true;
    isRateSelected = false;
    isNameSelected = false;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }

  void changeToCity() {
    isArabic() ? orderArabic = 'cityNameArabic' : order = 'cityName';
    isStarsSelected = false;
    isRateSelected = false;
    isNameSelected = false;
    isCitySelected = true;

    emit(HotelChangeOrderBy());
  }

  //-------------------Hotel Functions------------------------------------
  void canLaunchUrlFunction() async {
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      hasCallSupport = result;
      debugPrint('can lunch function activated');
    });
  }

  //------------------------------------------------------
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //----------------------------------------------------------
  void changeOrder() {
    isDescending = !isDescending;
    emit(HotelChangeOrder());
  }
//--------------------------------------------------------
}
