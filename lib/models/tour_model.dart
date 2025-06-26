import 'package:your_tour_guide/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TourModel implements Model {
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

  List<TourModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return TourModel(
        description: dataMap['description'],
        descriptionArabic: dataMap['descriptionArabic'],
        duration: dataMap['duration'],
        durationArabic: dataMap['durationArabic'],
        exclusions: dataMap['exclusions'],
        exclusionsArabic: dataMap['exclusionsArabic'],
        imageUrl: dataMap['imageUrl'],
        images: dataMap['images'],
        inclusions: dataMap['inclusions'],
        inclusionsArabic: dataMap['inclusionsArabic'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        pickupFrom: dataMap['pickupFrom'],
        pickupFromArabic: dataMap['pickupFromArabic'],
        startPrice: dataMap['startPrice'],
        startPriceArabic: dataMap['startPriceArabic'],
        tourItinerary: dataMap['tourItinerary'],
        tourItineraryArabic: dataMap['tourItineraryArabic'],
        tourLocation: dataMap['tourLocation'],
        tourLocationArabic: dataMap['tourLocationArabic'],
        tripOrganizer: dataMap['tripOrganizer'],
        tripOrganizerLogo: dataMap['tripOrganizerLogo'],
        type: dataMap['type'],
        website: dataMap['website'],
        docId: dataMap['docId'],
        tourType: dataMap['tourType'],
        tourTypeArabic: dataMap['tourTypeArabic'],
        phone: dataMap['phone'],
        tripOrganizerArabic: dataMap['tripOrganizerArabic'],
        tourAvailability: dataMap['tourAvailability'],
        tourAvailabilityArabic: dataMap['tourAvailabilityArabic'],
        email: dataMap['email'],
        booking: dataMap['booking'],
      );
    }).toList();
  }

  factory TourModel.fromJson(dataMap) {
    return TourModel(
      description: dataMap['description'],
      descriptionArabic: dataMap['descriptionArabic'],
      duration: dataMap['duration'],
      durationArabic: dataMap['durationArabic'],
      exclusions: dataMap['exclusions'],
      exclusionsArabic: dataMap['exclusionsArabic'],
      imageUrl: dataMap['imageUrl'],
      images: dataMap['images'],
      inclusions: dataMap['inclusions'],
      inclusionsArabic: dataMap['inclusionsArabic'],
      name: dataMap['name'],
      nameArabic: dataMap['nameArabic'],
      pickupFrom: dataMap['pickupFrom'],
      pickupFromArabic: dataMap['pickupFromArabic'],
      startPrice: dataMap['startPrice'],
      startPriceArabic: dataMap['startPriceArabic'],
      tourItinerary: dataMap['tourItinerary'],
      tourItineraryArabic: dataMap['tourItineraryArabic'],
      tourLocation: dataMap['tourLocation'],
      tourLocationArabic: dataMap['tourLocationArabic'],
      tripOrganizer: dataMap['tripOrganizer'],
      tripOrganizerLogo: dataMap['tripOrganizerLogo'],
      type: dataMap['type'],
      website: dataMap['website'],
      docId: dataMap['docId'],
      tourType: dataMap['tourType'],
      tourTypeArabic: dataMap['tourTypeArabic'],
      phone: dataMap['phone'],
      tripOrganizerArabic: dataMap['tripOrganizerArabic'],
      tourAvailability: dataMap['tourAvailability'],
      tourAvailabilityArabic: dataMap['tourAvailabilityArabic'],
      email: dataMap['email'],
      booking: dataMap['booking'],
    );
  }

  TourModel(
      {required this.description,
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
      required this.booking});
}
