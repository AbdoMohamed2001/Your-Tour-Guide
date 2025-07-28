class PlaceEntity {
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

  PlaceEntity({
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
    required this.transport,
    required this.transportArabic,
    required this.docId,
    required this.isBest,
    required this.metroImageUrl,
    required this.includeTour,
    required this.tourDocId,
    this.collectionRef = 'places',
  });
}
