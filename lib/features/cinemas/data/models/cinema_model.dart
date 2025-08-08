import 'package:your_tour_guide/features/cinemas/data/models/movie_model.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/cinema_entity.dart';

class CinemaModel {
  final String address;
  final String addressArabic;
  final String cityName;
  final String cityNameArabic;
  final String docId;
  final List<MovieModel> films;
  final List<MovieModel> filmsArabic;
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

  CinemaModel({
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
  });

  factory CinemaModel.fromJson(doc) {
    return CinemaModel(
      address: doc['address'],
      addressArabic: doc['addressArabic'],
      cityName: doc['cityName'],
      cityNameArabic: doc['cityNameArabic'],
      imageUrl: doc['imageUrl'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      rate: doc['rate'],
      images: doc['images'],
      mapUrl: doc['mapUrl'],
      openingHours: doc['openingHours'],
      openingHoursArabic: doc['openingHoursArabic'],
      tickets: doc['tickets'],
      ticketsArabic: doc['ticketsArabic'],
      phone: doc['phone'],
      website: doc['website'],
      docId: doc['docId'],
      films: (doc['films'] as List<dynamic>)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      filmsArabic: (doc['filmsArabic'] as List<dynamic>)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
    );
  }

  CinemaEntity toEntity() {
    return CinemaEntity(
      address: address,
      addressArabic: addressArabic,
      cityName: cityName,
      cityNameArabic: cityNameArabic,
      docId: docId,
      films: films.map((room) => room.toEntity()).toList(),
      filmsArabic: filmsArabic.map((room) => room.toEntity()).toList(),
      imageUrl: imageUrl,
      images: images,
      mapUrl: mapUrl,
      name: name,
      nameArabic: nameArabic,
      openingHours: openingHours,
      openingHoursArabic: openingHoursArabic,
      phone: phone,
      rate: rate,
      tickets: tickets,
      ticketsArabic: ticketsArabic,
      website: website,
    );
  }
}
