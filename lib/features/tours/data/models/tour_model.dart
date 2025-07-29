import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';

class TourModel {
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

  TourModel({
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
  });

  factory TourModel.fromJson(doc) {
    return TourModel(
      booking: doc['booking'],
      description: doc['description'],
      descriptionArabic: doc['descriptionArabic'],
      docId: doc['docId'],
      duration: doc['duration'],
      durationArabic: doc['durationArabic'],
      email: doc['email'],
      exclusions: doc['exclusions'],
      exclusionsArabic: doc['exclusionsArabic'],
      imageUrl: doc['imageUrl'],
      images: doc['images'],
      inclusions: doc['inclusions'],
      inclusionsArabic: doc['inclusionsArabic'],
      name: doc['name'],
      nameArabic: doc['nameArabic'],
      phone: doc['phone'],
      pickupFrom: doc['pickupFrom'],
      pickupFromArabic: doc['pickupFromArabic'],
      startPrice: doc['startPrice'],
      startPriceArabic: doc['startPriceArabic'],
      tourAvailability: doc['tourAvailability'],
      tourAvailabilityArabic: doc['tourAvailabilityArabic'],
      tourItinerary: doc['tourItinerary'],
      tourItineraryArabic: doc['tourItineraryArabic'],
      tourLocation: doc['tourLocation'],
      tourLocationArabic: doc['tourLocationArabic'],
      tourType: doc['tourType'],
      tourTypeArabic: doc['tourTypeArabic'],
      tripOrganizer: doc['tripOrganizer'],
      tripOrganizerArabic: doc['tripOrganizerArabic'],
      tripOrganizerLogo: doc['tripOrganizerLogo'],
      type: doc['type'],
      website: doc['website'],
    );
  }

  TourEntity toEntity() {
    return TourEntity(
      description: description,
      descriptionArabic: descriptionArabic,
      duration: duration,
      durationArabic: durationArabic,
      exclusions: exclusions,
      exclusionsArabic: exclusionsArabic,
      imageUrl: imageUrl,
      images: images,
      inclusions: inclusions,
      inclusionsArabic: inclusionsArabic,
      name: name,
      nameArabic: nameArabic,
      pickupFrom: pickupFrom,
      pickupFromArabic: pickupFromArabic,
      startPrice: startPrice,
      startPriceArabic: startPriceArabic,
      tourItinerary: tourItinerary,
      tourItineraryArabic: tourItineraryArabic,
      tourLocation: tourLocation,
      tourLocationArabic: tourLocationArabic,
      tripOrganizer: tripOrganizer,
      tripOrganizerLogo: tripOrganizerLogo,
      type: type,
      website: website,
      docId: docId,
      tourType: tourType,
      tourTypeArabic: tourTypeArabic,
      phone: phone,
      tripOrganizerArabic: tripOrganizerArabic,
      tourAvailability: tourAvailability,
      tourAvailabilityArabic: tourAvailabilityArabic,
      email: email,
      booking: booking,
    );
  }
}
