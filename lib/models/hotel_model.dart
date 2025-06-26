import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  final String about;
  final String aboutArabic;
  final String address;
  final String addressArabic;
  final String averagePrice;
  final Map book;
  final String cityName;
  final String cityNameArabic;
  final List distanceTo;
  final List distanceToArabic;
  final String docId;
  final String email;
  final List features;
  final List featuresArabic;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final String name;
  final String nameArabic;
  final List nearlyTo;
  final List nearlyToArabic;
  final num noOfFloors;
  final num noOfRooms;
  final List roomFacilities;
  final List roomFacilitiesArabic;
  final List rooms;
  final List roomsArabic;
  final num phone;
  final num rate;
  final Map socialMedia;
  final num stars;
  final String webSite;

  List<HotelModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return HotelModel(
        //------------------------------------------------------------------

        about: dataMap['about'],
        aboutArabic: dataMap['aboutArabic'],
        address: dataMap['address'],
        addressArabic: dataMap['addressArabic'],
        averagePrice: dataMap['averagePrice'],
        book: dataMap['book'],
        cityName: dataMap['cityName'],
        cityNameArabic: dataMap['cityNameArabic'],
        distanceTo: dataMap['distanceTo'],
        distanceToArabic: dataMap['distanceToArabic'],
        docId: dataMap['docId'],
        email: dataMap['email'],
        features: dataMap['features'],
        featuresArabic: dataMap['featuresArabic'],
        imageUrl: dataMap['imageUrl'],
        images: dataMap['images'],
        mapUrl: dataMap['mapUrl'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        nearlyTo: dataMap['nearlyTo'],
        nearlyToArabic: dataMap['nearlyToArabic'],
        noOfFloors: dataMap['noOfFloors'],
        noOfRooms: dataMap['noOfRooms'],
        roomFacilities: dataMap['roomFacilities'],
        roomFacilitiesArabic: dataMap['roomFacilitiesArabic'],
        rooms: dataMap['rooms'],
        roomsArabic: dataMap['roomsArabic'],
        socialMedia: dataMap['socialMedia'],
        phone: dataMap['phone'],
        rate: dataMap['rate'],
        stars: dataMap['stars'],
        webSite: dataMap['webSite'],
      );
    }).toList();
  }

//------------------------------------------------------------------------------------
  factory HotelModel.fromJson(dataMap) {
    return HotelModel(
      about: dataMap['about'],
      aboutArabic: dataMap['aboutArabic'],
      address: dataMap['address'],
      addressArabic: dataMap['addressArabic'],
      averagePrice: dataMap['averagePrice'],
      book: dataMap['book'],
      cityName: dataMap['cityName'],
      cityNameArabic: dataMap['cityNameArabic'],
      distanceTo: dataMap['distanceTo'],
      distanceToArabic: dataMap['distanceToArabic'],
      docId: dataMap['docId'],
      email: dataMap['email'],
      features: dataMap['features'],
      featuresArabic: dataMap['featuresArabic'],
      imageUrl: dataMap['imageUrl'],
      images: dataMap['images'],
      mapUrl: dataMap['mapUrl'],
      name: dataMap['name'],
      nameArabic: dataMap['nameArabic'],
      nearlyTo: dataMap['nearlyTo'],
      nearlyToArabic: dataMap['nearlyToArabic'],
      noOfFloors: dataMap['noOfFloors'],
      noOfRooms: dataMap['noOfRooms'],
      roomFacilities: dataMap['roomFacilities'],
      roomFacilitiesArabic: dataMap['roomFacilitiesArabic'],
      rooms: dataMap['rooms'],
      roomsArabic: dataMap['roomsArabic'],
      socialMedia: dataMap['socialMedia'],
      phone: dataMap['phone'],
      rate: dataMap['rate'],
      stars: dataMap['stars'],
      webSite: dataMap['webSite'],
      //----------------------------------------------------------
    );
  }

  HotelModel(
      {required this.about,
      required this.aboutArabic,
      required this.address,
      required this.addressArabic,
      required this.averagePrice,
      required this.book,
      required this.cityName,
      required this.cityNameArabic,
      required this.distanceTo,
      required this.distanceToArabic,
      required this.docId,
      required this.email,
      required this.features,
      required this.featuresArabic,
      required this.imageUrl,
      required this.images,
      required this.mapUrl,
      required this.name,
      required this.nameArabic,
      required this.nearlyTo,
      required this.nearlyToArabic,
      required this.noOfFloors,
      required this.noOfRooms,
      required this.roomFacilities,
      required this.roomFacilitiesArabic,
      required this.rooms,
      required this.roomsArabic,
      required this.phone,
      required this.rate,
      required this.socialMedia,
      required this.stars,
      required this.webSite});
}
