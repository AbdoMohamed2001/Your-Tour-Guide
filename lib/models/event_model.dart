import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String about;
  final String aboutArabic;
  final String docId;
  final String email;
  final String endDate;
  final String eventLink;
  final List exclusions;
  final List exclusionsArabic;
  final String imageUrl;
  final List inclusions;
  final List inclusionsArabic;
  final String location;
  final String locationArabic;
  final String name;
  final String nameArabic;
  final String organizer;
  final String phone;
  final String startDate;
  final String website;

  EventModel(
      {required this.about,
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
      required this.website});

  List<EventModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return EventModel(
        about: dataMap['about'],
        aboutArabic: dataMap['aboutArabic'],
        email: dataMap['email'],
        endDate: dataMap['endDate'],
        eventLink: dataMap['eventLink'],
        exclusions: dataMap['exclusions'],
        exclusionsArabic: dataMap['exclusionsArabic'],
        imageUrl: dataMap['imageUrl'],
        inclusions: dataMap['inclusions'],
        inclusionsArabic: dataMap['inclusionsArabic'],
        location: dataMap['location'],
        locationArabic: dataMap['locationArabic'],
        name: dataMap['name'],
        nameArabic: dataMap['nameArabic'],
        organizer: dataMap['organizer'],
        phone: dataMap['phone'],
        startDate: dataMap['startDate'],
        website: dataMap['website'],
        docId: dataMap['docId'],
      );
    }).toList();
  }

  factory EventModel.fromJson(dataMap) {
    return EventModel(
      about: dataMap['about'],
      aboutArabic: dataMap['aboutArabic'],
      email: dataMap['email'],
      endDate: dataMap['endDate'],
      eventLink: dataMap['eventLink'],
      exclusions: dataMap['exclusions'],
      exclusionsArabic: dataMap['exclusionsArabic'],
      imageUrl: dataMap['imageUrl'],
      inclusions: dataMap['inclusions'],
      inclusionsArabic: dataMap['inclusionsArabic'],
      location: dataMap['location'],
      locationArabic: dataMap['locationArabic'],
      name: dataMap['name'],
      nameArabic: dataMap['nameArabic'],
      organizer: dataMap['organizer'],
      phone: dataMap['phone'],
      startDate: dataMap['startDate'],
      website: dataMap['website'],
      docId: dataMap['docId'],
    );
  }
}
