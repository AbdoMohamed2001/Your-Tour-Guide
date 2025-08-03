import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/places/presentation/views/best_places_view.dart';
import 'package:your_tour_guide/generated/assets.dart';

import '../../../home/presentation/views/features/all_tours.dart';
import '../../../events/presentation/views/events_view.dart';
import '../../../../generated/l10n.dart';
import '../../../cities/presentation/views/cities_view.dart';

class FeaturesContainerEntity {
  final String name;
  final String icon;
  final Color containerColor;
  final Widget pushedPage;
  final String collectionName;
  final String appBarTitle;
  FeaturesContainerEntity({
    required this.name,
    required this.containerColor,
    required this.pushedPage,
    required this.icon,
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
      pushedPage: BestPlacesView(),
      icon: Assets.iconsBestPlace,
      collectionName: 'places',
      appBarTitle: S.of(context).AllBestPlaces,
    ),
    //AllCities
    FeaturesContainerEntity(
      name: S.of(context).cities,
      containerColor: Color(0xff613208),
      pushedPage: CitiesView(),
      icon: Assets.iconsAllCities,
      collectionName: 'cities',
      appBarTitle: S.of(context).cities,
    ),
    //Tours
    FeaturesContainerEntity(
      name: S.of(context).ToursAndTrips,
      containerColor: Color(0xff00478F),
      pushedPage: AllTours(),
      icon: Assets.iconsTour,
      collectionName: 'Tours',
      appBarTitle: S.of(context).tours,
    ),
    //UpcomingEvent
    FeaturesContainerEntity(
      // name: 'UpcomingEvents',
      name: S.of(context).UpcomingEvents,
      containerColor: Color(0xffd89d27),
      pushedPage: EventsView(),
      icon: Assets.iconsEvent,
      collectionName: 'Events',
      appBarTitle: S.of(context).UpcomingEventsAppbar,
    ),
  ];
}
