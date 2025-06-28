import 'package:your_tour_guide/features/cities/domain/entities/city_services_entity.dart';

class CityServicesModel {
  final String name;
  final String nameArabic;
  final String imageUrl;
  final String collectionRef;

  CityServicesModel({
    required this.name,
    required this.nameArabic,
    required this.imageUrl,
    required this.collectionRef,
  });

  factory CityServicesModel.fromJson(json) {
    return CityServicesModel(
      name: json['name'],
      nameArabic: json['nameArabic'],
      imageUrl: json['imageUrl'],
      collectionRef: json['collectionRef'],
    );
  }

  CityServicesEntity toEntity() {
    return CityServicesEntity(
      name: name,
      nameArabic: nameArabic,
      imageUrl: imageUrl,
      collectionRef: collectionRef,
    );
  }
}
