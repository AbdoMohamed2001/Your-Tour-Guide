import 'package:flutter/material.dart';

Icon getCollectionIcon(String collection) {
  switch (collection) {
    case 'restaurants':
      return const Icon(Icons.restaurant_menu_outlined);
    case 'places':
      return const Icon(Icons.place_outlined);
    case 'hotels':
      return const Icon(Icons.hotel_class_outlined);
    case 'cafes':
      return const Icon(Icons.local_cafe_outlined);
    case 'malls':
      return const Icon(Icons.local_mall_outlined);
    case 'cinemas':
      return const Icon(Icons.tv_outlined);
    case 'mosques':
      return const Icon(Icons.mosque_outlined);
    case 'churchs':
      return const Icon(Icons.church_outlined);
    case 'tourGuides':
      return const Icon(Icons.person_outlined);
    case 'tours':
      return const Icon(Icons.tour_outlined);
    default:
      return const Icon(Icons.location_on_outlined);
  }
}
