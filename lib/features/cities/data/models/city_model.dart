import '../../domain/entities/city_entity.dart';
import 'city_services_model.dart';

class CityModel {
  final String imageUrl;
  final String name;
  final String nameArabic;
  final List<CityServicesModel> services;

  CityModel({
    required this.imageUrl,
    required this.name,
    required this.nameArabic,
    required this.services,
  });

  factory CityModel.fromJson(doc) {
    return CityModel(
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      imageUrl: doc['imageUrl'],
      services: (doc['services'] as List<dynamic>)
          .map((item) => CityServicesModel.fromJson(item))
          .toList(),
    );
  }

  CityEntity toEntity() {
    return CityEntity(
      imageUrl: imageUrl,
      name: name,
      nameArabic: nameArabic,
      services: services.map((service) => service.toEntity()).toList(),
    );
  }
}
