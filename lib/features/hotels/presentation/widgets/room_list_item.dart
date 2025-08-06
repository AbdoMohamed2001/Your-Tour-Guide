import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_room_entity.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

class RoomListItem extends StatelessWidget {
  const RoomListItem({
    super.key,
    required this.room,
  });

  final HotelRoomEntity room;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultCachedNetworkImage(
            imageUrl: isArabic() ? room.imageUrl : room.imageUrl,
            imageHeight: height * 0.145,
          ),
          kSizedBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //name
                Center(
                  child: Text(
                    room.name,
                    style: TextStyles.bold14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 6),
                //---------------------------------------
                //contains
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).contains,
                        style: TextStyles.bold14,
                      ),
                      SizedBox(width: 5),
                      containsPeople(noOfPeople: room.noOfPeople),
                    ],
                  ),
                ),
                //---------------------------------------
                //bed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Bed Text
                    Text(S.of(context).bed, style: TextStyles.bold14),
                    Text(
                      room.bed.replaceAll('_b', '\n'),
                      style: TextStyles.bold14,
                    ),
                    SizedBox(width: 5),
                    room.bed.toString().contains('_b')
                        ? Column(
                            children: [
                              SizedBox(height: 6),
                              Icon(Icons.bed),
                              SizedBox(height: 8),
                              Icon(Icons.king_bed)
                            ],
                          )
                        : room.bed.toString().contains('2')
                            ? Column(
                                children: [
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.bed),
                                      Icon(Icons.bed),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(height: 6),
                                  Icon(Icons.bed),
                                ],
                              )
                    // Icon(Icons.bed),
                  ],
                ),
                SizedBox(height: 25),
                //AVG PRICE
              ],
            ),
          ),
          Spacer(),
          Container(
            color: AppColors.primaryColor.withAlpha(180),
            width: double.infinity,
            height: 30,
            child: Center(
              child: Text(
                isArabic()
                    ? "${room.averagePrice} لليلة الواحدة "
                    : "${room.averagePrice} for 1 night",
                style: TextStyles.bold14.copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget containsPeople({required int noOfPeople}) {
  if (noOfPeople == 1) {
    return Icon(Icons.person);
  } else if (noOfPeople == 2) {
    return Icon(Icons.people);
  } else if (noOfPeople == 3) {
    return Row(
      children: [
        Icon(Icons.people_rounded),
        Icon(Icons.person),
      ],
    );
  } else if (noOfPeople == 4) {
    return Row(
      children: [
        Icon(Icons.people_rounded),
        Icon(Icons.people_rounded),
      ],
    );
  } else {
    return Icon(Icons.people_rounded);
  }
}
