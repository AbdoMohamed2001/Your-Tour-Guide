import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';

class MosqueModel {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String description;
  final String descriptionArabic;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final String name;
  final String nameArabic;
  final Map openingHours;
  final Map openingHoursArabic;
  final num rate;
  final String docId;

  factory MosqueModel.fromJson(doc) {
    return MosqueModel(
      address: doc['address'],
      addressArabic: doc['addressArabic'],
      cityName: doc['cityName'],
      cityNameArabic: doc['cityNameArabic'],
      description: doc['description'],
      descriptionArabic: doc['descriptionArabic'],
      imageUrl: doc['imageUrl'],
      images: doc['images'],
      mapUrl: doc['mapUrl'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      rate: doc['rate'],
      docId: doc['docId'],
    );
  }

  MosqueModel({
    required this.address,
    required this.addressArabic,
    required this.cityName,
    required this.cityNameArabic,
    required this.description,
    required this.descriptionArabic,
    required this.imageUrl,
    required this.images,
    required this.mapUrl,
    required this.name,
    required this.nameArabic,
    required this.openingHours,
    required this.openingHoursArabic,
    required this.rate,
    required this.docId,
  });

  MosqueEntity toEntity() {
    return MosqueEntity(
      address: address,
      addressArabic: addressArabic,
      cityName: cityName,
      cityNameArabic: cityNameArabic,
      description: description,
      descriptionArabic: descriptionArabic,
      imageUrl: imageUrl,
      images: images,
      mapUrl: mapUrl,
      name: name,
      nameArabic: nameArabic,
      openingHours: openingHours,
      openingHoursArabic: openingHoursArabic,
      rate: rate,
      docId: docId,
    );
  }
}
