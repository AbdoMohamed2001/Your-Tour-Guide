import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/features/hotels/presentation/views/room_view.dart';
import 'package:flutter/material.dart';

class RoomListItem extends StatelessWidget {
  const RoomListItem({
    super.key,
    required this.hotelEntity,
    required this.index,
  });

  final HotelEntity hotelEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return RoomScreen(hotelEntity: hotelEntity, index: index);
        }));
      },
      child: Container(
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //image
                DefaultCachedNetworkImage(
                  imageUrl: isArabic()
                      ? hotelEntity.roomsArabic[index].imageUrl
                      : hotelEntity.rooms[index].imageUrl,
                  imageHeight: height * 0.145,
                ),
                kSizedBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //name
                      Text(
                        hotelEntity.rooms[index].name,
                        style: TextStyles.bold14,
                      ),
                      SizedBox(height: 6),
                      //---------------------------------------
                      //contains
                      Row(
                        children: [
                          Text(
                            S.of(context).contains,
                            style: TextStyles.bold14,
                          ),
                          SizedBox(width: 5),
                          containsPeople(
                              noOfPeople:
                                  hotelEntity.roomsArabic[index].noOfPeople),
                        ],
                      ),
                      //---------------------------------------
                      //bed
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Bed Text
                          Text(S.of(context).bed, style: TextStyles.bold14),
                          isArabic()
                              ? Text(hotelEntity.roomsArabic[index].bed
                                  .replaceAll('_b', '\n'))
                              : Text(
                                  hotelEntity.rooms[index].bed
                                      .replaceAll('_b', '\n'),
                                  style: TextStyles.bold14,
                                ),

                          SizedBox(width: 5),
                          hotelEntity.roomsArabic[index].bed
                                  .toString()
                                  .contains('_b')
                              ? Column(
                                  children: [
                                    SizedBox(height: 6),
                                    Icon(Icons.bed),
                                    SizedBox(height: 8),
                                    Icon(Icons.king_bed)
                                  ],
                                )
                              : hotelEntity.roomsArabic[index].bed
                                      .toString()
                                      .contains('2')
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
                    ],
                  ),
                ),
              ],
            ),
            //avg Price
            Text(
              isArabic()
                  ? "${hotelEntity.roomsArabic[index].averagePrice} لليلة الواحدة "
                  : "${hotelEntity.rooms[index].averagePrice} for 1 night",
              style: TextStyles.bold14.copyWith(color: Colors.orange),
            )
          ],
        ),
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
