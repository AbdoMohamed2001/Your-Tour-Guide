import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/all_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/all_hotels_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityInitial());
  static CityCubit get(context) => BlocProvider.of(context);
  late String? cityName = '';
  late List<AllCitiesModel> listOfCityModel = [
    //-------------------------------------------------------------------
    //tours
    //-------------------------------------------------------------------
    //place
    AllCitiesModel(
      image: 'placeImageUrl',
      name: S.current.Places,
      pushedPage: AllScreen(
        collectionName: 'places' ,
        appBarText: S.current.AllPlaces,
        cityName: cityName!,
      ),
    ),
    //-------------------------------------------------------------------
    //hotel
    AllCitiesModel(
      image: 'hotelImageUrl',
      name: S.current.Hotels,
      pushedPage: AllHotels(
        cityName: cityName!,
      ),
    ),
    //-------------------------------------------------------------------
    //rest
    AllCitiesModel(
      image: 'restImageUrl',
      name: S.current.Restaurants,
      pushedPage: AllScreen(
        collectionName: 'restaurants',
        appBarText: S.current.AllRestaurants,
        cityName: cityName!,

      ),
    ),
    //-------------------------------------------------------------------
    //mall
    AllCitiesModel(
      image: 'mallImageUrl',
      name: S.current.Malls,
      pushedPage: AllScreen(
        collectionName: 'malls',
        appBarText: S.current.AllMalls,
        cityName: cityName!,

      ),
    ),
    //-------------------------------------------------------------------
    //cafe
    AllCitiesModel(
      image: 'cafeImageUrl',
      name: S.current.Cafes,
      pushedPage: AllScreen(
        collectionName: 'cafes',
        appBarText: S.current.AllCafes,
        cityName: cityName!,

      ),
    ),
    //-------------------------------------------------------------------
    //mosque
    AllCitiesModel(
      image: 'mosqueImageUrl',
      name: S.current.Mosques,
      pushedPage: AllScreen(
        collectionName: 'mosques',
        appBarText: S.current.AllMosques,
        cityName: cityName!,

      ),
    ),
    //-------------------------------------------------------------------
    //church
    AllCitiesModel(
      image: 'churchsImageUrl',
      name: S.current.Churches,
      pushedPage: AllScreen(
        collectionName: 'churchs',
        appBarText: S.current.AllChurches,
        cityName: cityName!,

      ),
    ),
    //-------------------------------------------------------------------
    //tourCompanies
    // AllCitiesModel(
    //   image: 'tourCompanyImageUrl',
    //   name: 'Tourism Companies',
    //   pushedPage: AllScreen(
    //     collectionName: 'TourCompanies',
    //     appBarText: 'All TourCompanies',
    //     cityName: cityName!,
    //
    //   ),
    // ),
    //-------------------------------------------------------------------
    //cinema
    AllCitiesModel(
      image: 'cinemaImageUrl',
      name: S.current.Cinemas,
      pushedPage: AllScreen(
        collectionName: 'cinemas',
        appBarText: S.current.AllCinemas,

        cityName: cityName!,
      ),
    ),
    //-------------------------------------------------------------------
    //tourGuides
    // AllCitiesModel(
    //   image: 'tourGuideImageUrl',
    //   name: 'Tour Guides',
    //   pushedPage: AllScreen(
    //     collectionName: 'TourGuides',
    //     appBarText: 'All Tour Guides',
    //     cityName: cityName!,
    //
    //   ),
    // ),
    //-------------------------------------------------------------------
  ];
}

class AllCitiesModel {
  final String image;
  final String name;
  final Widget pushedPage;

  AllCitiesModel({
    required this.image,
    required this.name,
    required this.pushedPage,

  });
}
