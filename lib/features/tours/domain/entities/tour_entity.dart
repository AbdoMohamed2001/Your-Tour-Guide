class TourEntity {
  final String description;
  final String descriptionArabic;
  final String duration;
  final String durationArabic;
  final List<dynamic> exclusions;
  final List<dynamic> exclusionsArabic;
  final String imageUrl;
  final List<dynamic> images;
  final List<dynamic> inclusions;
  final List<dynamic> inclusionsArabic;
  final String name;
  final String nameArabic;
  final String pickupFrom;
  final String pickupFromArabic;
  final String startPrice;
  final String startPriceArabic;
  final List<dynamic> tourItinerary;
  final List<dynamic> tourItineraryArabic;
  final String tourLocation;
  final String tourLocationArabic;
  final String tripOrganizer;
  final String tripOrganizerLogo;
  final String type;
  final String website;
  final String docId;
  final String tourType;
  final String tourTypeArabic;
  final String phone;
  final String tripOrganizerArabic;
  final String tourAvailability;
  final String tourAvailabilityArabic;
  final String email;
  final String booking;
  final String placeDocId;
  final String collectionRef;
  final String cityName;
  final String cityNameArabic;
  final num rate;

  TourEntity({
    required this.description,
    required this.descriptionArabic,
    required this.duration,
    required this.durationArabic,
    required this.exclusions,
    required this.exclusionsArabic,
    required this.imageUrl,
    required this.images,
    required this.inclusions,
    required this.inclusionsArabic,
    required this.name,
    required this.nameArabic,
    required this.pickupFrom,
    required this.pickupFromArabic,
    required this.startPrice,
    required this.startPriceArabic,
    required this.tourItinerary,
    required this.tourItineraryArabic,
    required this.tourLocation,
    required this.tourLocationArabic,
    required this.tripOrganizer,
    required this.tripOrganizerLogo,
    required this.type,
    required this.website,
    required this.docId,
    required this.tourType,
    required this.tourTypeArabic,
    required this.phone,
    required this.tripOrganizerArabic,
    required this.tourAvailability,
    required this.tourAvailabilityArabic,
    required this.email,
    required this.booking,
    required this.placeDocId,
    this.collectionRef = 'tours',
    this.cityName = ' ',
    this.cityNameArabic = ' ',
    this.rate = 4.5,
  });
}
