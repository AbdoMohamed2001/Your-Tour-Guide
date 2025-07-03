import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';
import 'package:your_tour_guide/core/utils/widgets/facalities_item.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({
    Key? key,
    required this.hotelEntity,
    required this.index,
  }) : super(key: key);

  final HotelEntity hotelEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.black54,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Stack(
                children: [
                  DefaultCachedNetworkImage(
                    imageUrl: isArabic()
                        ? hotelEntity.roomsArabic[index].imageUrl
                        : hotelEntity.rooms[index].imageUrl,
                    imageHeight: 250,
                  ),
                  Positioned(
                    //38
                    bottom: hotelEntity.roomsArabic[index].name.length > 35 ||
                            hotelEntity.rooms[index].name.length > 35
                        ? 10
                        : 10,
                    right: isArabic() ? 12 : null,
                    left: isArabic() ? null : 12,
                    child: BorderedText(
                      strokeColor: Colors.black,
                      child: Text(
                        isArabic()
                            ? hotelEntity.roomsArabic[index].name
                            : hotelEntity.rooms[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize:
                              hotelEntity.roomsArabic[index].name.length > 35 ||
                                      hotelEntity.rooms[index].name.length > 35
                                  ? 16
                                  : 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //---------------------------------------
              //Room Facalities
              SizedBox(
                height: 450,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (_, index) => BuildFacilitiesItem(
                      index: index, hotelEntity: hotelEntity),
                  itemCount: isArabic()
                      ? hotelEntity.roomFacilitiesArabic.length
                      : hotelEntity.roomFacilities.length,
                ),
              ),
              //---------------------------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name

                    SizedBox(
                      height: 8,
                    ),

                    //---------------------------------------
                    //Contains
                    Row(
                      children: [
                        Text(
                          S.of(context).contains,
                          style: TextStyle(fontSize: isArabic() ? 22 : 24),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        hotelEntity.roomsArabic[index].noOfPeople == 1
                            ? Icon(
                                Icons.person,
                                size: 32,
                              )
                            : hotelEntity.roomsArabic[index].noOfPeople == 3
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.people_rounded,
                                        size: 32,
                                      ),
                                      Icon(
                                        Icons.person,
                                        size: 32,
                                      ),
                                    ],
                                  )
                                : hotelEntity.roomsArabic[index].noOfPeople == 4
                                    ? Row(
                                        children: [
                                          Icon(Icons.people_rounded),
                                          Icon(Icons.people_rounded),
                                        ],
                                      )
                                    : Icon(Icons.people_rounded),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //---------------------------------------
                    //Bed
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).bed,
                          style: TextStyle(fontSize: isArabic() ? 22 : 24),
                        ),
                        isArabic()
                            ? Text(
                                hotelEntity.roomsArabic[index].bed
                                    .replaceAll('_b', '\n'),
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              )
                            : Text(
                                hotelEntity.rooms[index].bed
                                    .replaceAll('_b', '\n'),
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),

                        SizedBox(
                          width: 5,
                        ),
                        hotelEntity.roomsArabic[index].bed.contains('_b')
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Icon(
                                    Icons.bed,
                                    size: 32,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Icon(
                                    Icons.king_bed,
                                    size: 32,
                                  )
                                ],
                              )
                            : hotelEntity.roomsArabic[index].bed.contains('2')
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.bed,
                                            size: 32,
                                          ),
                                          Icon(
                                            Icons.bed,
                                            size: 32,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Icon(
                                        Icons.bed,
                                        size: 32,
                                      ),
                                    ],
                                  )
                        // Icon(Icons.bed),
                      ],
                    ),
                    //                  Text(S.of(context).avgPrice),
                    //                   Text(hotelEntity.roomsArabic![index]['averagePrice']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Container(
//                   child:
//
//
//                   Text(
//                     isArabic()? hotelEntity.roomFacilitiesArabic![indexx]:
//                     hotelEntity.roomFacilities![indexx],
//                     style: TextStyle(color: Colors.orange,
//                     fontSize: 20,
//                     ),
//
//                   ),
//                 ),
