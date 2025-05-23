import 'package:cloud_firestore/cloud_firestore.dart';

class CinemaModel {
  final String? address;
  final String? addressArabic;
  final String? cityName;
  final String? cityNameArabic;
  final String? docId;
  final List? films;
  final List? filmsArabic;
  final String? imageUrl;
  final List? images;
  final String? mapUrl;
  final String? name;
  final String? nameArabic;
  final Map? openingHours;
  final Map? openingHoursArabic;
  final num? phone;
  final num? rate;
  final String? tickets;
  final String? ticketsArabic;
  final String? website;


  CinemaModel({
     this.address,
     this.addressArabic,
     this.cityName,
     this.cityNameArabic,
     this.imageUrl,
     this.images,
     this.mapUrl,
     this.name,
     this.nameArabic,
     this.openingHours,
     this.openingHoursArabic,
     this.phone,
     this.rate,
     this.tickets,
     this.ticketsArabic,
     this.website,
     this.docId,
     this.films,
     this.filmsArabic,

  });
  List<CinemaModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;
      return CinemaModel(
          address :     dataMap['address'],
          addressArabic :     dataMap['addressArabic'],
          cityName:     dataMap['cityName'],
          cityNameArabic:     dataMap['cityNameArabic'],
          imageUrl:     dataMap['imageUrl'],
          images:       dataMap['images'],
          mapUrl:       dataMap['mapUrl'],
          name:         dataMap['name'],
          nameArabic:         dataMap['nameArabic'],
          openingHours: dataMap['openingHours'],
          openingHoursArabic: dataMap['openingHoursArabic'],
          phone:        dataMap['phone'],
          rate:         dataMap['rate'],
          tickets:      dataMap['tickets'],
          ticketsArabic:      dataMap['ticketsArabic'],
          website:      dataMap['website'],
          docId:        dataMap['docId'],
          films:        dataMap['films'],
          filmsArabic:        dataMap['filmsArabic'],

      );
    }).toList();
  }

//-------------------------------------------------------------
  factory CinemaModel.fromJson(doc) {
    return CinemaModel(
      address:      doc['address'],
      addressArabic:      doc['addressArabic'],
      cityName:     doc['cityName'],
      cityNameArabic:     doc['cityNameArabic'],
      imageUrl:     doc['imageUrl'],
      name:         doc['name'],
      nameArabic:         doc['nameArabic'],
      rate:         doc['rate'],
      images:       doc['images'],
      mapUrl:       doc['mapUrl'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      tickets:      doc['tickets'],
      ticketsArabic:      doc['ticketsArabic'],
      phone:        doc['phone'],
      website:      doc['website'],
      docId:        doc['docId'],
      films:        doc['films'],
      filmsArabic:        doc['filmsArabic'],

    );
  }
}
