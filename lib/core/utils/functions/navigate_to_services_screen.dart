import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/presentation/views/cafes_views.dart';
import 'package:your_tour_guide/features/churchs/presentation/views/churches_view.dart';
import 'package:your_tour_guide/features/cinemas/presentation/views/cinemas_view.dart';
import 'package:your_tour_guide/features/hotels/presentation/views/hotels_view.dart';
import 'package:your_tour_guide/features/malls/presentation/views/malls_view.dart';
import 'package:your_tour_guide/features/mosques/presentation/views/mosques_view.dart';
import 'package:your_tour_guide/features/home/presentation/views/home_view.dart';
import 'package:your_tour_guide/features/places/presentation/views/places_view.dart';
import 'package:your_tour_guide/features/restaurants/presentation/views/restaurants_views.dart';

void navigateToServiceScreen(String collectionRef, BuildContext context,
    {String? cityName}) {
  switch (collectionRef) {
    case 'places':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlacesView(cityName: cityName),
          ));
    case 'hotels':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HotelsView(cityName: cityName),
          ));
    case 'restaurants':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantsView(cityName: cityName),
          ));
    case 'cafes':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CafesView(cityName: cityName),
          ));
    case 'malls':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MallsView(cityName: cityName),
          ));
    case 'cinemas':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CinemasView(cityName: cityName),
          ));
    case 'mosques':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MosquesView(cityName: cityName),
          ));
    case 'churchs':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChurchesView(cityName: cityName),
          ));
    case 'tourGuides':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'tourCompanies':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
  }
}
