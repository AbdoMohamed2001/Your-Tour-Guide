import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';

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

  RestaurantModel({
    required this.address,
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
    required this.rate,
  });

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

  RestaurantEntity toEntity() {
    return RestaurantEntity(
      address: address,
      addressArabic: addressArabic,
      cityName: cityName,
      cityNameArabic: cityNameArabic,
      docId: docId,
      email: email,
      imageUrl: imageUrl,
      images: images,
      mapUrl: mapUrl,
      meals: meals,
      mealsArabic: mealsArabic,
      menuImages: menuImages,
      name: name,
      nameArabic: nameArabic,
      openingHours: openingHours,
      openingHoursArabic: openingHoursArabic,
      phone: phone,
      rate: rate,
    );
  }
}
