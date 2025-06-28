import 'package:your_tour_guide/features/cities/domain/entities/city_services_entity.dart';

class CityEntity {
  final String imageUrl;
  final String name;
  final String nameArabic;
  final List<CityServicesEntity> services;

  CityEntity({
    required this.imageUrl,
    required this.name,
    required this.nameArabic,
    required this.services,
  });
}
