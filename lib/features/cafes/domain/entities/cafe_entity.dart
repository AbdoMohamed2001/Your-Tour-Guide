class CafeEntity {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String docId;
  final String email;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final List meals;
  final List mealsArabic;
  final List menuImages;
  final String name;
  final String nameArabic;
  final Map openingHours;
  final Map openingHoursArabic;
  final num phone;
  final num rate;
  final String collectionRef;

  CafeEntity({
    required this.address,
    required this.addressArabic,
    required this.cityName,
    required this.cityNameArabic,
    required this.docId,
    required this.email,
    required this.imageUrl,
    required this.images,
    required this.mapUrl,
    required this.meals,
    required this.mealsArabic,
    required this.menuImages,
    required this.name,
    required this.nameArabic,
    required this.openingHours,
    required this.openingHoursArabic,
    required this.phone,
    required this.rate,
    this.collectionRef = 'cafes',
  });
}
