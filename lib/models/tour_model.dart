import 'package:your_tour_guide/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TourModel implements Model {
  final String? description;
  final String? descriptionArabic;
  final String? duration;
  final String? durationArabic;
  final List<dynamic>? exclusions;
  final List<dynamic>? exclusionsArabic;
  final String? imageUrl;
  final List<dynamic>? images;
  final List<dynamic>? inclusions;
  final List<dynamic>? inclusionsArabic;
  final String? name;
  final String? nameArabic;
  final String? pickupFrom;
  final String? pickupFromArabic;
  final String? startPrice;
  final String? startPriceArabic;
  final List<dynamic>? tourItinerary;
  final List<dynamic>? tourItineraryArabic;
  final String? tourLocation;
  final String? tourLocationArabic;
  final String? tripOrganizer;
  final String? tripOrganizerLogo;
  final String? type;
  final String? website;
  final String? docId;
  final String? tourType;
  final String? tourTypeArabic;
  final String? phone;
  final String? tripOrganizerArabic;
  final String? tourAvailability;
  final String? tourAvailabilityArabic;
  final String? email;
  final String? booking;

  TourModel({
    this.description,
    this.descriptionArabic,
    this.duration,
    this.durationArabic,
    this.exclusions,
    this.exclusionsArabic,
    this.imageUrl,
    this.images,
    this.inclusions,
    this.inclusionsArabic,
    this.name,
    this.nameArabic,
    this.pickupFrom,
    this.pickupFromArabic,
    this.startPrice,
    this.startPriceArabic,
    this.tourItinerary,
    this.tourItineraryArabic,
    this.tourLocation,
    this.tourLocationArabic,
    this.tripOrganizer,
    this.tripOrganizerLogo,
    this.type,
    this.website,
    this.docId,
    this.tourType,
    this.tourTypeArabic,
    this.phone,
    this.tripOrganizerArabic,
    this.tourAvailability,
    this.tourAvailabilityArabic,
    this.email,
    this.booking,
  });

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
}
