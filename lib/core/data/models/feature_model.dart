import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';

class FeatureModel {
  final String name;
  final String imageUrl;
  final String nameArabic;

  FeatureModel({
    required this.name,
    required this.imageUrl,
    required this.nameArabic,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      name: json['name'],
      nameArabic: json['nameArabic'],
      imageUrl: json['imageUrl'],
    );
  }

  FeatureEntity toEntity() {
    return FeatureEntity(
      name: name,
      nameArabic: nameArabic,
      imageUrl: imageUrl,
    );
  }
}
