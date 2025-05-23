import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/models/mosque_model.dart';
import 'package:your_tour_guide/models/place_model.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/hotel_model.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  static PlaceCubit get(context) => BlocProvider.of(context);
  PlaceCubit() : super(PlaceInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late var likedKey ;
  bool likedValue = false;
  final storage = FirebaseStorage.instance;
  final dataKey = new GlobalKey();
  bool isFavourite = false;
  bool isRated = false;
  Color iconColor = Colors.white;
  Color isRatedColor = Colors.black;
  //-------------------Hotel var-----------------------------------------
  bool hasCallSupport = false;
  Future<void>? launched;
  String phone = '';
  bool isDescending = true;
  String order = 'cityName';
  String orderArabic = 'cityNameArabic';
  bool isStarsSelected = false;
  bool isRateSelected = false;
  bool isNameSelected = true;
  bool isCitySelected = false;

  void changeToName()  {
    isArabic() ? orderArabic = 'nameArabic' : order = 'name';
    isStarsSelected = false;
    isRateSelected = false;
    isNameSelected = true;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }
  void changeToRate()  {
    isArabic() ? orderArabic = 'rate' : order = 'rate';
    isStarsSelected = false;
    isRateSelected = true;
    isNameSelected = false;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }
  void changeToStars()  {
    isArabic() ? orderArabic = 'stars' : order = 'stars';
    isStarsSelected = true;
    isRateSelected = false;
    isNameSelected = false;
    isCitySelected = false;

    emit(HotelChangeOrderBy());
  }
  void changeToCity()  {
    isArabic() ? orderArabic = 'cityNameArabic' : order = 'cityName';
    isStarsSelected = false;
    isRateSelected = false;
    isNameSelected = false;
    isCitySelected = true;

    emit(HotelChangeOrderBy());
  }
  //-------------------Place Var------------------------------------
  bool isServicesNameSelected = true;
  bool isServicesRateSelected = false;
  bool isServiceCitySelected = false;

  String servicesOrder = 'cityName';
  String servicesOrderArabic = 'cityNameArabic';
  void changeServicesOrder(){
    isDescending = !isDescending;
    emit(HotelChangeOrder());
  }
  void changeServicesToName()  {
    isArabic() ? servicesOrderArabic = 'nameArabic' : servicesOrder = 'name';
    isServicesNameSelected = true;
    isServicesRateSelected = false;
    isServiceCitySelected = false;
    emit(HotelChangeOrderBy());
    print('this is services order arabic $servicesOrderArabic');
  }
  void changeServicesToRate()  {
    isArabic() ? servicesOrderArabic = 'rate' : servicesOrder = 'rate';
    isServicesNameSelected = false;
    isServicesRateSelected = true;
    isServiceCitySelected = false;
    emit(HotelChangeOrderBy());
  }
  void changeServicesToCity()  {
    isArabic() ? servicesOrderArabic = 'cityNameArabic' : servicesOrder = 'cityName';
    isServicesNameSelected = false;
    isServicesRateSelected = false;
    isServiceCitySelected = true;
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
  //--------------------------------------------------------

  //--------------------------------------------------------
  void restorePersistedPref() async {
    print('restore started');
    var preferences = await SharedPreferences.getInstance();
    bool? likedBool = preferences.getBool(likedKey);
    print('this is liked bool from SharedPref');
    print(likedBool);
      likedBool == null ? print('null null null null null null null null ') :
      this.likedValue = likedBool;
    print('restore ended');
    emit(PlaceRestorePersistedPref());

  }
  //--------------------------------------------------------
  void changeState(){
    emit(PlaceChangeState());
  }
  //--------------------------------------------------------
  void changeLike(){
    likedValue = !likedValue;
    emit(PlaceChangeLiked());
  }
  //----------------------------------------------------------
  void changeOrder(){
    isDescending = !isDescending;
    emit(HotelChangeOrder());
  }



  //-------------------Favourite Functions------------------------------------
  Future<void> addTourToFavourite({
    required TourModel tourModel,
    required var docID,
    required BuildContext context,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('tours')
        .doc(docID)
        .set({
      "booking"          : tourModel.booking,
      'description'      : tourModel.description,
      'descriptionArabic': tourModel.descriptionArabic,
      'docId'            : tourModel.docId,
      'duration'         : tourModel.duration,
      'durationArabic'   : tourModel.durationArabic,
      'email'            : tourModel.email,
      'exclusions'  :     tourModel.exclusions,
      'exclusionsArabic'  :     tourModel.exclusionsArabic,
      'imageUrl':          tourModel.imageUrl,
      'images':            tourModel.images,
      'inclusions'  :          tourModel.inclusions,
      'inclusionsArabic': tourModel.inclusionsArabic,
      'name': tourModel.name,
      'nameArabic': tourModel.nameArabic,
      'phone': tourModel.phone,
      'pickupFrom': tourModel.pickupFrom,
      'pickupFromArabic ': tourModel.pickupFromArabic,
      'startPrice'  : tourModel.startPrice,
      'startPriceArabic'  : tourModel.startPriceArabic,
      'tourAvailability'  : tourModel.tourAvailability,
      'tourAvailabilityArabic'  : tourModel.tourAvailabilityArabic,
      'tourItinerary'  : tourModel.tourItinerary,
      'tourItineraryArabic'  : tourModel.tourItineraryArabic,
      'tourLocation'  : tourModel.tourLocation,
      'tourLocationArabic'  : tourModel.tourLocationArabic,
      'tourType'  : tourModel.tourType,
      'tourTypeArabic'  : tourModel.tourTypeArabic,
      'tripOrganizer'  : tourModel.tripOrganizer,
      'tripOrganizerArabic'  : tourModel.tripOrganizerArabic,
      'tripOrganizerLogo'  : tourModel.tripOrganizerLogo,
      'type'  : tourModel.type,
      'website'  : tourModel.website,

    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }
  //----------------------------------------------------------
  Future<void> addPlaceToFavourite({
    required PlaceModel placeModel,
    required var docID,
    required BuildContext context,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('places')
        .doc(docID)
        .set({
      "address": placeModel.address,
      "addressArabic": placeModel.addressArabic,
      'cityName': placeModel.cityName,
      'cityNameArabic': placeModel.cityNameArabic,
      'description': placeModel.description,
      'descriptionArabic': placeModel.descriptionArabic,
      'docId'  : placeModel.docId,
      'imageUrl': placeModel.imageUrl,
      'images': placeModel.images,
      'includeTour'  : placeModel.includeTour,
      'isBest'  : placeModel.isBest,
      'mapUrl': placeModel.mapUrl,
      'metroImageUrl': placeModel.metroImageUrl,
      'name': placeModel.name,
      'nameArabic': placeModel.nameArabic,
      'openingHours': placeModel.openingHours,
      'openingHoursArabic': placeModel.openingHoursArabic,
      'rate': placeModel.rate,
      'tickets': placeModel.tickets,
      'ticketsArabic': placeModel.ticketsArabic,
      'tourDocId'  : placeModel.tourDocId,
      'transport'  : placeModel.transport,
      'transportArabic'  : placeModel.transportArabic,
    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }
  //----------------------------------------------------------
  Future<void> addRestaurantToFavourite({
    required RestaurantModel restaurantModel,
    required var docID,
    required BuildContext context,
    required String collectionName,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection(collectionName)
        .doc(docID)
        .set({
      "address": restaurantModel.address,
      "addressArabic": restaurantModel.addressArabic,
      'cityName': restaurantModel.cityName,
      'cityNameArabic': restaurantModel.cityNameArabic,
      'docId'  : restaurantModel.docId,
      'email': restaurantModel.email,
      'imageUrl': restaurantModel.imageUrl,
      'images': restaurantModel.images,
      'mapUrl': restaurantModel.mapUrl,
      'meals': restaurantModel.meals,
      'mealsArabic': restaurantModel.mealsArabic,
      'menuImages': restaurantModel.menuImages,
      'name': restaurantModel.name,
      'nameArabic': restaurantModel.nameArabic,
      'openingHours': restaurantModel.openingHours,
      'openingHoursArabic': restaurantModel.openingHoursArabic,
      'phone': restaurantModel.phone,
      'rate': restaurantModel.rate,

    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }
  //----------------------------------------------------------
  Future<void> addMallToFavourite({
    required MallModel mallModel,
    required var docID,
    required BuildContext context,
    required String collectionName,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection(collectionName)
        .doc(docID)
        .set({
      "address": mallModel.address,
      "addressArabic": mallModel.addressArabic,
      'cityName': mallModel.cityName,
      'cityNameArabic': mallModel.cityNameArabic,
      'description': mallModel.description,
      'descriptionArabic': mallModel.descriptionArabic,
      'docId'  : mallModel.docId,
      'imageUrl': mallModel.imageUrl,
      'images': mallModel.images,
      'mapUrl': mallModel.mapUrl,
      'name': mallModel.name,
      'nameArabic': mallModel.nameArabic,
      'openingHours': mallModel.openingHours,
      'openingHoursArabic': mallModel.openingHoursArabic,
      'rate': mallModel.rate,

    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }
  //--------------------------------------------------------
  Future<void> addMosqueToFavourite({
    required MosqueModel mosqueModel,
    required var docID,
    required BuildContext context,
    required String collectionName,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection(collectionName)
        .doc(docID)
        .set({
      "address": mosqueModel.address,
      "addressArabic": mosqueModel.addressArabic,
      'cityName': mosqueModel.cityName,
      'cityNameArabic': mosqueModel.cityNameArabic,
      'description': mosqueModel.description,
      'descriptionArabic': mosqueModel.descriptionArabic,
      'docId'  : mosqueModel.docId,
      'imageUrl': mosqueModel.imageUrl,
      'images': mosqueModel.images,
      'mapUrl': mosqueModel.mapUrl,
      'name': mosqueModel.name,
      'nameArabic': mosqueModel.nameArabic,
      'openingHours': mosqueModel.openingHours,
      'openingHoursArabic': mosqueModel.openingHoursArabic,
      'rate': mosqueModel.rate,

    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }

  //--------------------------------------------------------
  Future<void> addCinemaToFavourite({
    required CinemaModel cinemaModel,
    required var docID,
    required BuildContext context,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('cinemas')
        .doc(docID)
        .set({
      "address": cinemaModel.address,
      "addressArabic": cinemaModel.addressArabic,
      'cityName': cinemaModel.cityName,
      'cityNameArabic': cinemaModel.cityNameArabic,
      'docId': cinemaModel.docId,
      'films': cinemaModel.films,
      'filmsArabic': cinemaModel.filmsArabic,
      'imageUrl': cinemaModel.imageUrl,
      'images': cinemaModel.images,
      'mapUrl': cinemaModel.mapUrl,
      'name': cinemaModel.name,
      'nameArabic': cinemaModel.nameArabic,
      'openingHours': cinemaModel.openingHours,
      'openingHoursArabic': cinemaModel.openingHoursArabic,
      'phone': cinemaModel.phone,
      'rate': cinemaModel.rate,
      'tickets': cinemaModel.tickets,
      'ticketsArabic': cinemaModel.ticketsArabic,
      'website': cinemaModel.website,
    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }
  //
  //----------------------------------------------------------
  Future<void> addHotelToFavourite({
    required HotelModel hotelModel,
    required var docID,
    required BuildContext context,
  }) async {
    emit(PlaceAddedToFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('hotels')
        .doc(docID)
        .set({
      "about": hotelModel.about,
      "aboutArabic": hotelModel.aboutArabic,
      "address": hotelModel.address,
      "addressArabic": hotelModel.addressArabic,
      "averagePrice": hotelModel.averagePrice,
      "book": hotelModel.book,
      'cityName': hotelModel.cityName,
      'cityNameArabic': hotelModel.cityNameArabic,
      'distanceTo': hotelModel.distanceTo,
      'distanceToArabic': hotelModel.distanceToArabic,
      'docId'  : hotelModel.docId,
      "email": hotelModel.email,
      "features": hotelModel.features,
      "featuresArabic": hotelModel.featuresArabic,
      'imageUrl': hotelModel.imageUrl,
      'images': hotelModel.images,
      'mapUrl': hotelModel.mapUrl,
      'name': hotelModel.name,
      'nameArabic': hotelModel.nameArabic,
      'nearlyTo': hotelModel.nearlyTo,
      'nearlyToArabic': hotelModel.nearlyToArabic,
      'noOfFloors': hotelModel.noOfFloors,
      'noOfRooms': hotelModel.noOfRooms,
      'phone': hotelModel.phone,
      'rate': hotelModel.rate,
      'roomFacilities': hotelModel.roomFacilities,
      'roomFacilitiesArabic': hotelModel.roomFacilitiesArabic,
      'rooms': hotelModel.rooms,
      'roomsArabic': hotelModel.roomsArabic,
      'socialMedia': hotelModel.socialMedia,
      'stars': hotelModel.stars,
      'webSite': hotelModel.webSite,

    }).then((value) {
      iconColor = Colors.red;
      showToast(msg: S.of(context).AddedToFavourite);
      emit(PlaceAddedToFavouriteSuccess());
      iconColor = Colors.red;
    }  ).onError((error, stackTrace) {
      showToast(msg: 'Failed to add to favourite');
      emit(PlaceAddedToFavouriteFailure(error.toString()));
      debugPrint(error.toString());

    });
  }

  //--------------------------------------------------------

  Future<void> deleteFromFavourite({
    required var docID,
    required BuildContext context,
  }) async {
    emit(PlaceDeleteFromFavouriteLoading());
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('places')
        .doc(docID)
        .delete()
        .then((value) {
      showToast(msg:S.of(context).RemovedFromFavourite);
      iconColor = Colors.white;
      emit(PlaceDeleteFromFavouriteSuccess());
      iconColor = Colors.white;
    }).onError((error, stackTrace) {
      emit(PlaceDeleteFromFavouriteFailure(error.toString()));
      debugPrint(error.toString());
    });
  }
//--------------------------------------------------------

}
