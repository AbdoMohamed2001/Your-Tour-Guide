import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';

import '../room_container.dart';

class RoomListView extends StatelessWidget {
  const RoomListView({
    super.key,
    required this.hotelEntity,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.37,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) =>
            RoomListItem(hotelEntity: hotelEntity, index: index),
        separatorBuilder: (_, index) => SizedBox(width: 4),
        itemCount: isArabic()
            ? hotelEntity.roomsArabic.length
            : hotelEntity.rooms.length,
      ),
    );
  }
}
