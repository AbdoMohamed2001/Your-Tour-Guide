import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/place_entity.dart';

class PlaceModel {
  final String? address;
  final String? addressArabic;
  final String? cityName;
  final String? cityNameArabic;
  final String? description;
  final String? descriptionArabic;
  final String? imageUrl;
  final List<dynamic>? images;
  final String? mapUrl;
  final String? name;
  final String? nameArabic;
  final Map? openingHours;
  final Map? openingHoursArabic;
  final num? rate;
  final Map? tickets;
  final Map? ticketsArabic;
  final Map? transport;
  final Map? transportArabic;
  final String? docId;
  final bool? isBest;
  final String? metroImageUrl;
  final bool? includeTour;
  final String? tourDocId;

  PlaceModel({
    this.address,
    this.addressArabic,
    this.cityName,
    this.cityNameArabic,
    this.description,
    this.descriptionArabic,
    this.imageUrl,
    this.images,
    this.mapUrl,
    this.name,
    this.nameArabic,
    this.openingHours,
    this.openingHoursArabic,
    this.rate,
    this.tickets,
    this.ticketsArabic,
    this.docId,
    this.isBest,
    this.metroImageUrl,
    this.includeTour,
    this.tourDocId,
    this.transport,
    this.transportArabic,
  });

  List<PlaceModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return PlaceModel(
        address: dataMap['address'],
        addressArabic: dataMap['addressArabic'],
        cityName: dataMap['cityName'],
        cityNameArabic: dataMap['cityNameArabic'],
        description: dataMap['description'],
        descriptionArabic: dataMap['descriptionArabic'],
        imageUrl: dataMap['imageUrl'],
        images: dataMap['images'],
        mapUrl: dataMap['mapUrl'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        openingHours: dataMap['openingHours'],
        openingHoursArabic: dataMap['openingHoursArabic'],
        rate: dataMap['rate'],
        docId: dataMap['docId'],
        tickets: dataMap['tickets'],
        ticketsArabic: dataMap['ticketsArabic'],
        isBest: dataMap['isBest'],
        metroImageUrl: dataMap['metroImageUrl'],
        includeTour: dataMap['includeTour'],
        tourDocId: dataMap['tourDocId'],
        transport: dataMap['transport'],
        transportArabic: dataMap['transportArabic'],
      );
    }).toList();
  }

  factory PlaceModel.fromJson(doc) {
    return PlaceModel(
      address: doc['address'],
      addressArabic: doc['addressArabic'],
      cityName: doc['cityName'],
      cityNameArabic: doc['cityNameArabic'],
      description: doc['description'],
      descriptionArabic: doc['descriptionArabic'],
      imageUrl: doc['imageUrl'],
      images: doc['images'],
      mapUrl: doc['mapUrl'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      rate: doc['rate'],
      tickets: doc['tickets'],
      ticketsArabic: doc['ticketsArabic'],
      docId: doc['docId'],
      isBest: doc['isBest'],
      metroImageUrl: doc['metroImageUrl'],
      includeTour: doc['includeTour'],
      tourDocId: doc['tourDocId'],
      transport: doc['transport'],
      transportArabic: doc['transportArabic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'addressArabic': addressArabic,
      'cityName': cityName,
      'cityNameArabic': cityNameArabic,
      'description': description,
      'descriptionArabic': descriptionArabic,
      'imageUrl': imageUrl,
      'images': images,
      'mapUrl': mapUrl,
      'name': name,
      'nameArabic': nameArabic,
      'openingHours': openingHours,
      'openingHoursArabic': openingHoursArabic,
      'rate': rate,
      'tickets': tickets,
      'ticketsArabic': ticketsArabic,
      'docId': docId,
      'isBest': isBest,
      'metroImageUrl': metroImageUrl,
      'includeTour': includeTour,
      'tourDocId': tourDocId,
      'transport': transport,
      'transportArabic': transportArabic,
    };
  }

  PlaceEntity toEntity() {
    return PlaceEntity(
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
      tickets: tickets,
      ticketsArabic: ticketsArabic,
      docId: docId,
      isBest: isBest,
      metroImageUrl: metroImageUrl,
      includeTour: includeTour,
      tourDocId: tourDocId,
      transport: transport,
      transportArabic: transportArabic,
    );
  }
}
