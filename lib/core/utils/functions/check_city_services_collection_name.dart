import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cities/domain/entities/city_services_entity.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/home_view.dart';

void navigateToCityService(
    CityServicesEntity cityServicesEntity, BuildContext context) {
  switch (cityServicesEntity.collectionRef) {
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
            builder: (_) => HomeView(),
          ));
    case 'restaurants':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
          ));
    case 'cafes':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeView(),
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
