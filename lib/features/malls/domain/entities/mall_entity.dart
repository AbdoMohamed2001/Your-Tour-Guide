class MallEntity {
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
  final String collectionRef;

  MallEntity({
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
    this.collectionRef = 'malls',
  });
}
