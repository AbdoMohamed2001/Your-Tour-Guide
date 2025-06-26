import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/city_entity.dart';

class CityModel {
  final String imageUrl;
  final String name;
  final String nameArabic;
  final String cityName;
  final String cafeImageUrl;
  final String churchsImageUrl;
  final String cinemaImageUrl;
  final String hotelImageUrl;
  final String mallImageUrl;
  final String mosqueImageUrl;
  final String placeImageUrl;
  final String restImageUrl;
  final String tourCompanyImageUrl;
  final String tourGuideImageUrl;

  CityModel({
    required this.cafeImageUrl,
    required this.churchsImageUrl,
    required this.cinemaImageUrl,
    required this.cityName,
    required this.hotelImageUrl,
    required this.imageUrl,
    required this.mallImageUrl,
    required this.mosqueImageUrl,
    required this.placeImageUrl,
    required this.restImageUrl,
    required this.tourCompanyImageUrl,
    required this.tourGuideImageUrl,
    required this.name,
    required this.nameArabic,
  });

  List<CityModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return CityModel(
        placeImageUrl: dataMap['placeImageUrl'],
        restImageUrl: dataMap['restImageUrl'],
        tourCompanyImageUrl: dataMap['tourCompanyImageUrl'],
        tourGuideImageUrl: dataMap['tourGuideImageUrl'],
        cafeImageUrl: dataMap['cafeImageUrl'],
        churchsImageUrl: dataMap['churchsImageUrl'],
        cinemaImageUrl: dataMap['cinemaImageUrl'],
        hotelImageUrl: dataMap['hotelImageUrl'],
        mallImageUrl: dataMap['mallImageUrl'],
        mosqueImageUrl: dataMap['mosqueImageUrl'],
        cityName: dataMap['cityName'],
        imageUrl: dataMap['imageUrl'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
      );
    }).toList();
  }

  factory CityModel.fromJson(doc) {
    return CityModel(
      placeImageUrl: doc['placeImageUrl'],
      restImageUrl: doc['restImageUrl'],
      tourCompanyImageUrl: doc['tourCompanyImageUrl'],
      tourGuideImageUrl: doc['tourGuideImageUrl'],
      cafeImageUrl: doc['cafeImageUrl'],
      churchsImageUrl: doc['churchsImageUrl'],
      cinemaImageUrl: doc['cinemaImageUrl'],
      hotelImageUrl: doc['hotelImageUrl'],
      mallImageUrl: doc['mallImageUrl'],
      mosqueImageUrl: doc['mosqueImageUrl'],
      cityName: doc['cityName'],
      imageUrl: doc['imageUrl'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
    );
  }

  CityEntity toEntity() {
    return CityEntity(
      placeImageUrl: placeImageUrl,
      restImageUrl: restImageUrl,
      tourCompanyImageUrl: tourCompanyImageUrl,
      tourGuideImageUrl: tourGuideImageUrl,
      cafeImageUrl: cafeImageUrl,
      churchsImageUrl: churchsImageUrl,
      cinemaImageUrl: cinemaImageUrl,
      hotelImageUrl: hotelImageUrl,
      mallImageUrl: mallImageUrl,
      mosqueImageUrl: mosqueImageUrl,
      cityName: cityName,
      imageUrl: imageUrl,
      name: name,
      nameArabic: nameArabic,
    );
  }
}
