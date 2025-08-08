import 'package:your_tour_guide/features/cinemas/domain/entities/movie_entity.dart';

class CinemaEntity {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String docId;
  final List<MovieEntity> films;
  final List<MovieEntity> filmsArabic;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final String name;
  final String nameArabic;
  final Map openingHours;
  final Map openingHoursArabic;
  final num phone;
  final num rate;
  final String tickets;
  final String ticketsArabic;
  final String website;
  final String collectionRef;

  CinemaEntity({
    required this.address,
    required this.addressArabic,
    required this.cityName,
    required this.cityNameArabic,
    required this.docId,
    required this.films,
    required this.filmsArabic,
    required this.imageUrl,
    required this.images,
    required this.mapUrl,
    required this.name,
    required this.nameArabic,
    required this.openingHours,
    required this.openingHoursArabic,
    required this.phone,
    required this.rate,
    required this.tickets,
    required this.ticketsArabic,
    required this.website,
    this.collectionRef = 'cinemas',
  });

//-------------------------------------------------------------
}
