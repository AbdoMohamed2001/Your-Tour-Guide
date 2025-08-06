import 'package:your_tour_guide/features/favourite/domain/entities/favourite_entity.dart';

class FavouriteModel {
  final String docId;
  final String name;
  final String nameArabic;
  final String cityName;
  final String cityNameArabic;
  final String imageUrl;
  final String collectionName;
  final num rate;
  FavouriteModel({
    required this.docId,
    required this.name,
    required this.nameArabic,
    required this.cityName,
    required this.cityNameArabic,
    required this.imageUrl,
    required this.collectionName,
    required this.rate,
  });

  factory FavouriteModel.fromJson(json) {
    return FavouriteModel(
      docId: json['docId'],
      name: json['name'],
      nameArabic: json['nameArabic'],
      cityName: json['cityName'] ?? '',
      cityNameArabic: json['cityNameArabic'] ?? '',
      imageUrl: json['imageUrl'],
      collectionName: json['collectionName'],
      rate: json['rate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'name': name,
      'nameArabic': nameArabic,
      'cityName': cityName,
      'cityNameArabic': cityNameArabic,
      'imageUrl': imageUrl,
      'collectionName': collectionName,
      'rate': rate,
    };
  }

  FavouriteEntity toEntity() {
    return FavouriteEntity(
      docId: docId,
      name: name,
      nameArabic: nameArabic,
      cityName: cityName,
      cityNameArabic: cityNameArabic,
      imageUrl: imageUrl,
      collectionName: collectionName,
      rate: rate,
    );
  }
}
