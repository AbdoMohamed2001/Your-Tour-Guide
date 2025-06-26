import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String docId;
  final String email;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final List meals;
  final List mealsArabic;
  final List menuImages;
  final String name;
  final String nameArabic;
  final Map openingHours;
  final Map openingHoursArabic;
  final num phone;
  final num rate;

  List<RestaurantModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return RestaurantModel(
        address: dataMap['address'],
        addressArabic: dataMap['addressArabic'],
        cityName: dataMap['cityName'],
        cityNameArabic: dataMap['cityNameArabic'],
        docId: dataMap['docId'],
        email: dataMap['email'],
        imageUrl: dataMap['imageUrl'],
        images: dataMap['images'],
        mapUrl: dataMap['mapUrl'],
        meals: dataMap['meals'],
        mealsArabic: dataMap['mealsArabic'],
        menuImages: dataMap['menuImages'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        openingHours: dataMap['openingHours'],
        openingHoursArabic: dataMap['openingHoursArabic'],
        phone: dataMap['phone'],
        rate: dataMap['rate'],
      );
    }).toList();
  }

  factory RestaurantModel.fromJson(doc) {
    return RestaurantModel(
      address: doc['address'],
      addressArabic: doc['addressArabic'],
      cityName: doc['cityName'],
      cityNameArabic: doc['cityNameArabic'],
      email: doc['email'],
      imageUrl: doc['imageUrl'],
      meals: doc['meals'],
      mealsArabic: doc['mealsArabic'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      phone: doc['phone'],
      rate: doc['rate'],
      images: doc['images'],
      mapUrl: doc['mapUrl'],
      menuImages: doc['menuImages'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      docId: doc['docId'],
    );
  }

  RestaurantModel(
      {required this.address,
      required this.addressArabic,
      required this.cityName,
      required this.cityNameArabic,
      required this.docId,
      required this.email,
      required this.imageUrl,
      required this.images,
      required this.mapUrl,
      required this.meals,
      required this.mealsArabic,
      required this.menuImages,
      required this.name,
      required this.nameArabic,
      required this.openingHours,
      required this.openingHoursArabic,
      required this.phone,
      required this.rate});
}
