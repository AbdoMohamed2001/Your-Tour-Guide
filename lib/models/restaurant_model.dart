import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String? address;
  final String? addressArabic;
  final String? cityName;
  final String? cityNameArabic;
  final String? docId;
  final String? email;
  final String? imageUrl;
  final List? images;
  final String? mapUrl;
  final List? meals;
  final List? mealsArabic;
  final List? menuImages;
  final String? name;
  final String? nameArabic;
  final Map? openingHours;
  final Map? openingHoursArabic;
  final num? phone;
  final num? rate;

  RestaurantModel({
    this.address,
    this.addressArabic,
    this.cityName,
    this.cityNameArabic,
    this.email,
    this.imageUrl,
    this.images,
    this.mapUrl,
    this.meals,
    this.mealsArabic,
    this.menuImages,
    this.name,
    this.nameArabic,
    this.openingHours,
    this.openingHoursArabic,
    this.phone,
    this.rate,
    this.docId,
  });

  List<RestaurantModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return RestaurantModel(
        address:      dataMap['address'],
        addressArabic:      dataMap['addressArabic'],
        cityName:     dataMap['cityName'],
        cityNameArabic:     dataMap['cityNameArabic'],
        docId:        dataMap['docId'],
        email:        dataMap['email'],
        imageUrl:     dataMap['imageUrl'],
        images:       dataMap['images'],
        mapUrl:       dataMap['mapUrl'],
        meals:        dataMap['meals'],
        mealsArabic:        dataMap['mealsArabic'],
        menuImages:   dataMap['menuImages'],
        name:         dataMap['name'],
        nameArabic:         dataMap['nameArabic'],
        openingHours: dataMap['openingHours'],
        openingHoursArabic: dataMap['openingHoursArabic'],
        phone:        dataMap['phone'],
        rate:         dataMap['rate'],
      );
    }).toList();
  }

  factory RestaurantModel.fromJson(doc) {
    return RestaurantModel(
      address:      doc['address'],
      addressArabic:      doc['addressArabic'],
      cityName:     doc['cityName'],
      cityNameArabic:     doc['cityNameArabic'],
      email:        doc['email'],
      imageUrl:     doc['imageUrl'],
      meals:        doc['meals'],
      mealsArabic:        doc['mealsArabic'],
      name:         doc['name'],
      nameArabic:         doc['nameArabic'],
      phone:        doc['phone'],
      rate:         doc['rate'],
      images:       doc['images'],
      mapUrl:       doc['mapUrl'],
      menuImages:   doc['menuImages'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      docId:        doc['docId'],
    );
  }
}
