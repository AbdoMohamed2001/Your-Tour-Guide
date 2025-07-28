import '../../domian/entities/place_entity.dart';

class PlaceModel {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String description;
  final String descriptionArabic;
  final String imageUrl;
  final List<dynamic> images;
  final String mapUrl;
  final String name;
  final String nameArabic;
  final Map openingHours;
  final Map openingHoursArabic;
  final num rate;
  final Map tickets;
  final Map ticketsArabic;
  final Map transport;
  final Map transportArabic;
  final String docId;
  final bool isBest;
  final String metroImageUrl;
  final bool includeTour;
  final String tourDocId;
  final String collectionRef;

  PlaceModel({
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
    required this.tickets,
    required this.ticketsArabic,
    required this.docId,
    required this.isBest,
    required this.metroImageUrl,
    required this.includeTour,
    required this.tourDocId,
    required this.transport,
    required this.transportArabic,
    this.collectionRef = 'places',
  });

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
      collectionRef: collectionRef,
    );
  }
}
