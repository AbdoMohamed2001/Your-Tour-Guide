import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/room_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/widgets/room_container.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.hotelModel,
  });

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => RoomContainer(hotelModel: hotelModel,index: index),
        separatorBuilder: (_, index) => SizedBox(
          width: 4,
        ),
        itemCount: isArabic()? hotelModel.roomsArabic!.length
        : hotelModel.rooms!.length,
      ),
    );
  }
}

