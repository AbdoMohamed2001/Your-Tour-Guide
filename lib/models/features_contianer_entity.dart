import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../screens/cities/all_cities_screen.dart';
import '../screens/places/all_places.dart';
import '../screens/tours/all_tours.dart';
import '../screens/upcomingEvents/all_upcoming.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeaturesContainerEntity {
  final String name;
  final String fileName;
  final Color containerColor;
  final Widget pushedPage;
  final IconData icon;

  FeaturesContainerEntity({
    required this.name,
    required this.containerColor,
    required this.pushedPage,
    required this.icon,
    required this.fileName,
  });
}

List<FeaturesContainerEntity> getFeaturesList(BuildContext context) {
  return [
    //BestPlaces
    FeaturesContainerEntity(
      // containerColor: Color(0xff4d5667),
      // containerColor: Color(0xff19131b),
      name: S.of(context).bestPlaces,
      containerColor: Color(0xff19141b),

      pushedPage: AllPlaces(
        isBest: true,
        collectionName: 'places',
        appBarText: S.of(context).AllBestPlaces,
      ),
      icon: FontAwesomeIcons.hotel,
      fileName: 'bestPlace',
    ),
    //AllCities
    FeaturesContainerEntity(
      // name: 'AllCities',
      name: S.of(context).AllCities,
      containerColor: Color(0xff613208),
      pushedPage: AllCities(),
      icon: FontAwesomeIcons.solidBuilding,
      fileName: 'allCities',
    ),
    //Tours
    FeaturesContainerEntity(
      // name: 'ToursAndTrips',
      name: S.of(context).ToursAndTrips,
      containerColor: Color(0xff00478F),

      // containerColor: Color(0xffD18700),
      // containerColor: Color(0xff613207),
      pushedPage: AllTours(),
      icon: FontAwesomeIcons.suitcase,
      fileName: 'tour',
    ),
    //UpcomingEvent
    FeaturesContainerEntity(
      // name: 'UpcomingEvents',
      name: S.of(context).UpcomingEvents,
      containerColor: Color(0xffd89d27),
      pushedPage: AllUpcoming(),
      icon: Icons.today,
      fileName: 'event',
    ),
  ];
}
