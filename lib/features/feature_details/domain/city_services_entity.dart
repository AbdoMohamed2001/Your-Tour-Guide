import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'city_entity.dart';

class CityServicesEntity {
  final String image, title, collectionName, cityName;

  CityServicesEntity({
    required this.image,
    required this.title,
    required this.collectionName,
    required this.cityName,
  });
  static List<CityServicesEntity> getCityServices(
          CityEntity city, BuildContext context) =>
      [
        CityServicesEntity(
          collectionName: 'places',
          title: S.of(context).Places,
          image: city.placeImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'hotels',
          title: S.of(context).Hotels,
          image: city.hotelImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'restaurants',
          title: S.of(context).Restaurants,
          image: city.restImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'cafes',
          title: S.of(context).Cafes,
          image: city.cafeImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'cinemas',
          title: S.of(context).Cinemas,
          image: city.cinemaImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'malls',
          title: S.of(context).Malls,
          image: city.mallImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'mosques',
          title: S.of(context).Mosques,
          image: city.mosqueImageUrl,
          cityName: city.cityName,
        ),
        CityServicesEntity(
          collectionName: 'churchs',
          title: S.of(context).Churches,
          image: city.churchsImageUrl,
          cityName: city.cityName,
        ),
      ];
}
