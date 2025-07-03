import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/presentation/views/all_cafes_views.dart';
import 'package:your_tour_guide/features/hotels/presentation/views/all_hotels_view.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/home_view.dart';
import 'package:your_tour_guide/features/restaurants/presentation/views/all_rests_views.dart';

void navigateToServiceScreen(String collectionRef, BuildContext context) {
  switch (collectionRef) {
    case 'places':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'hotels':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AllHotelsView(cityName: ''),
          ));
    case 'restaurants':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AllRestsView(cityName: ''),
          ));
    case 'cafes':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AllCafesView(cityName: ''),
          ));
    case 'malls':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'cinemas':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'mosques':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'churchs':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
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
