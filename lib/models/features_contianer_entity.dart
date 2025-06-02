import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../screens/cities/all_cities_screen.dart';
import '../screens/tours/all_tours.dart';
import '../screens/upcomingEvents/all_upcoming.dart';

class FeaturesContainerEntity {
  final String name;
  final String fileName;
  final Color containerColor;
  final Widget pushedPage;
  final String collectionName;
  final String appBarTitle;
  FeaturesContainerEntity({
    required this.name,
    required this.containerColor,
    required this.pushedPage,
    required this.fileName,
    required this.collectionName,
    required this.appBarTitle,
  });
}

List<FeaturesContainerEntity> getFeaturesList(BuildContext context) {
  return [
    //BestPlaces
    FeaturesContainerEntity(
      name: S.of(context).bestPlaces,
      containerColor: Color(0xff19141b),
      pushedPage: AllCities(),
      // pushedPage: AllPlaces(
      //   isBest: true,
      //   collectionName: 'places',
      //   appBarText: S.of(context).AllBestPlaces,
      // ),
      fileName: 'bestPlace',
      collectionName: 'places',
      appBarTitle: S.of(context).AllBestPlaces,
    ),
    //AllCities
    FeaturesContainerEntity(
      // name: 'AllCities',
      name: S.of(context).AllCities,
      containerColor: Color(0xff613208),
      pushedPage: AllCities(),
      fileName: 'allCities',
      collectionName: 'cities',
      appBarTitle: S.of(context).AllCities,
    ),
    //Tours
    FeaturesContainerEntity(
      // name: 'ToursAndTrips',
      // containerColor: Color(0xffD18700),
      // containerColor: Color(0xff613207),
      name: S.of(context).ToursAndTrips,
      containerColor: Color(0xff00478F),
      pushedPage: AllTours(),
      fileName: 'tour',
      collectionName: 'Tours',
      appBarTitle: S.of(context).AllTours,
    ),
    //UpcomingEvent
    FeaturesContainerEntity(
      // name: 'UpcomingEvents',
      name: S.of(context).UpcomingEvents,
      containerColor: Color(0xffd89d27),
      pushedPage: AllUpcoming(),
      fileName: 'event',
      collectionName: 'Events',
      appBarTitle: S.of(context).UpcomingEventsAppbar,
    ),
  ];
}
