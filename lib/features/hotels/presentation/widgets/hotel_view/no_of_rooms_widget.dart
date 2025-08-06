import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
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
                    '${S.of(context).noOfFloors}${hotelEntity.noOfFloors}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
            hotelEntity.noOfFloors == 0 ? Container() : SizedBox(width: 8),
            Text(
              '${S.of(context).noOfRooms}${hotelEntity.noOfRooms}',
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
