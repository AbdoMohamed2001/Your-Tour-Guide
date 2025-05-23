import 'package:cloud_firestore/cloud_firestore.dart';

class MosqueModel {
  final String? address;
  final String? addressArabic;
  final String? cityName;
  final String? cityNameArabic;
  final String? description;
  final String? descriptionArabic;
  final String? imageUrl;
  final List? images;
  final String? mapUrl;
  final String? name;
  final String? nameArabic;
  final Map? openingHours;
  final Map? openingHoursArabic;
  final num? rate;
  final String? docId;

  MosqueModel({
    this.address,
    this.addressArabic,
    this.cityName,
    this.cityNameArabic,
    this.description,
    this.descriptionArabic,
    this.imageUrl,
    this.images,
    this.mapUrl,
    this.openingHours,
    this.openingHoursArabic,
    this.name,
    this.nameArabic,
    this.rate,
    this.docId,
  });

  List<MosqueModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return MosqueModel(
        address: dataMap['address'],
        addressArabic: dataMap['addressArabic'],
        cityName: dataMap['cityName'],
        cityNameArabic: dataMap['cityNameArabic'],
        description: dataMap['description'],
        descriptionArabic: dataMap['descriptionArabic'],
        imageUrl: dataMap['imageUrl'],
        images: dataMap['images'],
        mapUrl: dataMap['mapUrl'],
        openingHours: dataMap['openingHours'],
        openingHoursArabic: dataMap['openingHoursArabic'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        rate: dataMap['rate'],
        docId: dataMap['docId'],
      );
    }).toList();
  }

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
}
