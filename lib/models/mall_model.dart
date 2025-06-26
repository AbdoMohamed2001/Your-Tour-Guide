import 'package:cloud_firestore/cloud_firestore.dart';

class MallModel {
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

  List<MallModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return MallModel(
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

  factory MallModel.fromJson(doc) {
    return MallModel(
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

  MallModel(
      {required this.address,
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
      required this.docId});
}
