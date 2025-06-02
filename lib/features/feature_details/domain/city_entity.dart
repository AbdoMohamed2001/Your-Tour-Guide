import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';

class CityEntity extends FeatureEntity {
  final String cafeImageUrl;
  final String churchsImageUrl;
  final String cinemaImageUrl;
  final String cityName;
  final String hotelImageUrl;
  final String imageUrl;
  final String mallImageUrl;
  final String mosqueImageUrl;
  final String placeImageUrl;
  final String restImageUrl;
  final String tourCompanyImageUrl;
  final String tourGuideImageUrl;
  final String name, nameArabic;
  CityEntity({
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
  }) : super(name: name, nameArabic: nameArabic, imageUrl: imageUrl);
}
