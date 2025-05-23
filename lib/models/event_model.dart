import 'package:your_tour_guide/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel implements Model {
  final String? about;
  final String? aboutArabic;
  final String? docId;
  final String? email;
  final String? endDate;
  final String? eventLink;
  final List?   exclusions;
  final List?   exclusionsArabic;
  final String? imageUrl;
  final List?   inclusions;
  final List?   inclusionsArabic;
  final String? location;
  final String? locationArabic;
  final String? name;
  final String? nameArabic;
  final String? organizer;
  final String? phone;
  final String? startDate;
  final String? website;


  EventModel({

    this.about,
    this.aboutArabic,
    this.email,
    this.endDate,
    this.eventLink,
    this.exclusions,
    this.exclusionsArabic,
    this.imageUrl,
    this.inclusions,
    this.inclusionsArabic,
    this.location,
    this.locationArabic,
    this.name,
    this.nameArabic,
    this.organizer,
    this.phone,
    this.startDate,
    this.website,
    this.docId,

  });
  List<EventModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return EventModel(
         about:       dataMap['about'],
         aboutArabic :dataMap['aboutArabic'],
         email :      dataMap['email'],
         endDate :      dataMap['endDate'],
         eventLink :    dataMap['eventLink'],
         exclusions :   dataMap['exclusions'],
         exclusionsArabic : dataMap['exclusionsArabic'],
         imageUrl :         dataMap['imageUrl'],
         inclusions :       dataMap['inclusions'],
         inclusionsArabic : dataMap['inclusionsArabic'],
         location :         dataMap['location'],
         locationArabic :   dataMap['locationArabic'],
         name :             dataMap['name'],
         nameArabic :       dataMap['nameArabic'],
         organizer :        dataMap['organizer'],
         phone :            dataMap['phone'],
         startDate :dataMap['startDate'],
         website :dataMap['website'],
         docId :dataMap['docId'],
      );
    }).toList();
  }

  factory EventModel.fromJson(dataMap) {
    return EventModel(
      about: dataMap['about'],
      aboutArabic :dataMap['aboutArabic'],
      email :dataMap['email'],
      endDate :dataMap['endDate'],
      eventLink :dataMap['eventLink'],
      exclusions :dataMap['exclusions'],
      exclusionsArabic :dataMap['exclusionsArabic'],
      imageUrl :dataMap['imageUrl'],
      inclusions :dataMap['inclusions'],
      inclusionsArabic :dataMap['inclusionsArabic'],
      location :dataMap['location'],
      locationArabic :dataMap['locationArabic'],
      name :dataMap['name'],
      nameArabic :dataMap['nameArabic'],
      organizer :dataMap['organizer'],
      phone :dataMap['phone'],
      startDate :dataMap['startDate'],
      website :dataMap['website'],
      docId :dataMap['docId'],


    );
  }
}
