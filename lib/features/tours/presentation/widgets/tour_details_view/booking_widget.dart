import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/tour_entity.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({
    super.key,
    required this.tourEntity,
  });

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var url = Uri.parse(tourEntity.booking);
        if (await canLaunchUrl(
          url,
        )) {
          await launchUrl(url);
        }
        ;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'ارسل طلب لحجز لهذه الرحله ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
