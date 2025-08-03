import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/presentation/views/cafes_views.dart';
import 'package:your_tour_guide/features/cinemas/presentation/views/cinemas_view.dart';
import 'package:your_tour_guide/features/restaurants/presentation/views/restaurants_views.dart';
import '../../../../generated/l10n.dart';
import '../../../hotels/presentation/views/hotels_view.dart';
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
    pushedPage: HotelsView(),
  ),
  //Restaurants
  NearlyPlaceEntity(
    containerColor: Color(0xff613207),
    iconName: FontAwesomeIcons.utensils,
    iconColor: Colors.black,
    containerName: S.current.Restaurants,
    pushedPage: RestaurantsView(),
  ),
  //Cafes
  NearlyPlaceEntity(
    containerColor: Color(0xff613207),
    iconName: FontAwesomeIcons.mugHot,
    iconColor: Colors.black,
    containerName: S.current.Cafes,
    pushedPage: CafesView(),
  ),
  // //Cinemas
  NearlyPlaceEntity(
    containerColor: Color(0xff66191c),
    iconName: FontAwesomeIcons.film,
    iconColor: Colors.black,
    containerName: S.current.Cinemas,
    pushedPage: CinemasView(),
  ),
];
