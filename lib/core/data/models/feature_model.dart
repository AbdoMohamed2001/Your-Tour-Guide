import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';

class FeatureModel {
  final String name;
  final String imageUrl;

  FeatureModel({required this.name, required this.imageUrl});

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  FeatureEntity toEntity() {
    return FeatureEntity(name: name, imageUrl: imageUrl);
  }
}
