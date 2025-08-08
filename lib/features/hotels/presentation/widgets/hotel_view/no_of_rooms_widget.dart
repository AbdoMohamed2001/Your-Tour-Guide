import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        hotelEntity.noOfFloors == 0
            ? Container()
            : Row(
                children: [
                  Text(
                    S.of(context).noOfFloors,
                    style: TextStyles.bold16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    hotelEntity.noOfFloors.toString(),
                    style: TextStyles.bold16.copyWith(color: Colors.orange),
                  ),
                ],
              ),
        hotelEntity.noOfFloors == 0 ? Container() : SizedBox(width: 8),
        Row(
          children: [
            Text(
              S.of(context).noOfRooms,
              style: TextStyles.bold16,
            ),
            SizedBox(width: 8),
            Text(
              hotelEntity.noOfRooms.toString(),
              style: TextStyles.bold16.copyWith(color: Colors.orange),
            ),
          ],
        ),
      ],
    );
  }
}
