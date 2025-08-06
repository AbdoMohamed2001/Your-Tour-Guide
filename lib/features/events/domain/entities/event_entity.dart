class EventEntity {
  final String about;
  final String aboutArabic;
  final String docId;
  final String email;
  final String endDate;
  final String eventLink;
  final String imageUrl;
  final List exclusions;
  final List exclusionsArabic;
  final List inclusions;
  final List inclusionsArabic;
  final List images;
  final String location;
  final String locationArabic;
  final String name;
  final String nameArabic;
  final String organizer;
  final String phone;
  final String startDate;
  final String website;
  final String collectionRef;
  final String cityName;
  final String cityNameArabic;
  final num rate;

  EventEntity({
    required this.about,
    required this.aboutArabic,
    required this.docId,
    required this.email,
    required this.endDate,
    required this.eventLink,
    required this.exclusions,
    required this.exclusionsArabic,
    required this.imageUrl,
    required this.inclusions,
    required this.inclusionsArabic,
    required this.location,
    required this.locationArabic,
    required this.name,
    required this.nameArabic,
    required this.organizer,
    required this.phone,
    required this.startDate,
    required this.website,
    required this.images,
    this.collectionRef = 'Events',
    this.cityName = '',
    this.cityNameArabic = '',
    this.rate = 4.5,
  });
}
