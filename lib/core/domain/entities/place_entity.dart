class PlaceEntity {
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

  PlaceEntity({
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
}
