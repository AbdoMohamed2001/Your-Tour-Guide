class TourTypeEntity {
  final String name;
  final String nameArabic;
  final String imageUrl;
  final String id;
  final String collectionRef;

  TourTypeEntity({
    required this.name,
    required this.nameArabic,
    required this.imageUrl,
    required this.id,
    this.collectionRef = 'tours',
  });
}

List<TourTypeEntity> tourTypes = [
  TourTypeEntity(
    name: 'Day Tour',
    nameArabic: 'رحلة يوم واحد',
    imageUrl: 'https://mgatravel.com/wp-content/uploads/2020/12/egypt2.jpg',
    id: 'dayTour',
  ),
  TourTypeEntity(
    name: 'Tour Packages',
    nameArabic: 'رحلات كامله',
    imageUrl:
        'https://mgatravel.com/wp-content/uploads/2023/08/36aead5b-0c05-4841-aa8f-258b7ae1c180.jpg',
    id: 'tourPackage',
  ),
  TourTypeEntity(
    name: 'Nile Cruises',
    nameArabic: 'رحلات النيل',
    imageUrl:
        'https://images.pexels.com/photos/20506675/pexels-photo-20506675/free-photo-of-ferry-on-nile-river.jpeg',
    id: 'nileCruises',
  ),
  TourTypeEntity(
    name: 'For Egyptians',
    nameArabic: 'رحلات للمصريين',
    imageUrl:
        'https://rafeek.co/wp-content/uploads/2024/09/%D8%A3%D9%81%D8%B6%D9%84-%D9%85%D8%B5%D9%8A%D9%81-%D9%81%D9%8A-%D9%85%D8%B5%D8%B1.jpg',
    id: 'egyptiansTrips',
  ),
];
