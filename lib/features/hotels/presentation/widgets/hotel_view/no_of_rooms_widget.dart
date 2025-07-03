import 'package:flutter/material.dart';

import '../../../domain/entities/hotel_entity.dart';

class NoOfRoomsWidget extends StatelessWidget {
  const NoOfRoomsWidget({
    super.key,
    required this.hotelEntity,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            hotelEntity.noOfFloors == 0
                ? Container()
                : Text(
                    'عدد الطوابق : ${hotelEntity.noOfFloors}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
            hotelEntity.noOfFloors == 0
                ? Container()
                : SizedBox(
                    width: 8,
                  ),
            Text(
              'عدد الغرف : ${hotelEntity.noOfRooms}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(),
      ],
    );
  }
}
