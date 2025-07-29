import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/presentation/views/cafe_details_view.dart';
import 'package:your_tour_guide/features/churchs/presentation/views/church_details_view.dart';
import 'package:your_tour_guide/features/cinemas/presentation/views/cinema_details_view.dart';
import 'package:your_tour_guide/features/events/presentation/views/event_details_view.dart';
import 'package:your_tour_guide/features/hotels/presentation/views/hotel_details_view.dart';
import 'package:your_tour_guide/features/malls/presentation/views/mall_details_view.dart';
import 'package:your_tour_guide/features/mosques/presentation/views/moqsue_details_view.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/home_view.dart';
import 'package:your_tour_guide/features/places/presentation/views/place_details_view.dart';
import 'package:your_tour_guide/features/restaurants/presentation/views/restaurant_details_view.dart';

void navigateToServiceDetailsScreen(
    String collectionRef, BuildContext context, dynamic entity) {
  switch (collectionRef) {
    case 'places':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaceDetailsView(placeEntity: entity),
          ));
    case 'hotels':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HotelDetailsView(
              hotelEntity: entity,
            ),
          ));
    case 'restaurants':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailsView(
              restEntity: entity,
            ),
          ));
    case 'cafes':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CafeDetailsView(cafeEntity: entity),
          ));
    case 'malls':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MallDetailsView(mallEntity: entity),
          ));
    case 'cinemas':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CinemaDetailsView(cinemaEntity: entity),
          ));
    case 'mosques':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MosqueDetailsView(mosqueEntity: entity),
          ));
    case 'churchs':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChurchDetailsView(churchEntity: entity),
          ));
    case 'Events':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventDetailsView(eventEntity: entity),
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
