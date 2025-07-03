import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../screens/all_screen.dart';
import '../../../hotels/presentation/views/all_hotels_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NearlyPlaceEntity {
  final Color containerColor;
  final IconData iconName;
  final Color iconColor;
  final String containerName;
  final Widget pushedPage;

  NearlyPlaceEntity({
    required this.containerColor,
    required this.iconName,
    required this.iconColor,
    required this.containerName,
    required this.pushedPage,
  });
}

List<NearlyPlaceEntity> nearlyList = [
  //Hotels
  NearlyPlaceEntity(
    containerColor: Colors.black,
    iconName: FontAwesomeIcons.hotel,
    iconColor: Color(0xff613207),
    containerName: S.current.Hotels,
    pushedPage: AllHotelsView(cityName: ''),
  ),
  //Restaurants
  NearlyPlaceEntity(
    containerColor: Color(0xff613207),
    iconName: FontAwesomeIcons.utensils,
    iconColor: Colors.black,
    containerName: S.current.Restaurants,
    pushedPage: AllScreen(
      collectionName: 'restaurants',
      appBarText: S.current.AllRestaurants,
      cityName: '',
    ),
  ),
  //Cafes
  NearlyPlaceEntity(
    containerColor: Color(0xff613207),
    iconName: FontAwesomeIcons.mugHot,
    iconColor: Colors.black,
    containerName: S.current.Cafes,
    pushedPage: AllScreen(
      collectionName: 'cafes',
      appBarText: S.current.AllCafes,
      cityName: '',
    ),
  ),
  // //Cinemas
  NearlyPlaceEntity(
    containerColor: Color(0xff66191c),
    iconName: FontAwesomeIcons.film,
    iconColor: Colors.black,
    containerName: S.current.Cinemas,
    pushedPage: AllScreen(
      collectionName: 'cinemas',
      appBarText: S.current.AllCinemas,
      cityName: '',
    ),
  ),
];
