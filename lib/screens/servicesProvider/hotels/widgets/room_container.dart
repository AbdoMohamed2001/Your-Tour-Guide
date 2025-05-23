import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/room_screen.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:flutter/material.dart';

class RoomContainer extends StatelessWidget {
  const RoomContainer({
    super.key,
    required this.hotelModel,
    required this.index,
  });

  final HotelModel hotelModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return RoomScreen(
            hotelModel: hotelModel,
            index: index,
          );
        }));
      },
      child: Container(
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: homeCubit.isDark! ? Colors.black54 : Color(0xfff1f1f1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //image
                  DefaultCachedNetworkImage(
                    imageUrl: isArabic()
                        ? hotelModel.roomsArabic![index]['imageUrl'].length == 0 ?
                        'https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg'
                        : hotelModel.roomsArabic![index]['imageUrl']
                        : hotelModel.rooms![index]['imageUrl'].length == 0 ?
                    'https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg'
                        : hotelModel.rooms![index]['imageUrl'],
                    imageHeight: 130,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //name
                        isArabic()
                            ? Text(
                          hotelModel.roomsArabic![index]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 16,
                          ),
                        )
                            : Text(hotelModel.rooms![index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: hotelModel.rooms![index]['name'].toString().length >50 ?
                            14.5 : 16
                        ),
                        ),
                        SizedBox(height: 6,),


                        //---------------------------------------
                        //contains
                        Row(
                          children: [
                            Text(S.of(context).contains,
                              style: TextStyle(
                                fontSize: isArabic()? 14: 16
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            hotelModel.roomsArabic![index]['noOfPeople'] == 1
                                ? Icon(Icons.person)
                                : hotelModel.roomsArabic![index]['noOfPeople'] == 3 ?
                            Row(
                              children: [
                                Icon(Icons.people_rounded),
                                Icon(Icons.person),
                              ],
                            )
                            :
                            hotelModel.roomsArabic![index]['noOfPeople'] == 4 ?
                             Row(children: [
                               Icon(Icons.people_rounded),
                               Icon(Icons.people_rounded),
                             ],)
                            :Icon(Icons.people_rounded),
                          ],
                        ),
                        //---------------------------------------
                        //bed
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).bed,
                              style: TextStyle(
                                  fontSize: isArabic()? 14: 15
                              ),

                            ),
                            isArabic()
                                ? Text(hotelModel.roomsArabic![index]['bed']
                                .replaceAll('_b', '\n'))
                                : Text(hotelModel.rooms![index]['bed'].replaceAll('_b', '\n'),
                              style: TextStyle(
                                  fontSize: isArabic()? 14: 15
                              ),
                            ),

                            SizedBox(
                              width: 5,
                            ),
                            hotelModel.roomsArabic![index]['bed'].toString().contains('_b') ?
                                Column(
                                  children: [
                                    SizedBox(height: 6,),
                                    Icon(Icons.bed),
                                    SizedBox(height: 8,),
                                    Icon(Icons.king_bed)
                                  ],
                                ) :
                            hotelModel.roomsArabic![index]['bed'].toString().contains('2')?
                                Column(
                                  children: [
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Icon(Icons.bed),
                                        Icon(Icons.bed),
                                      ],
                                    ),
                                  ],
                                )
                                 :Column(
                                   children: [
                                     SizedBox(height: 6,),
                                     Icon(Icons.bed),
                                   ],
                                 )
                            // Icon(Icons.bed),
                          ],
                        ),
                        //__________________________________________
                        //avg price
                        SizedBox(height: 6,),

                      ],
                    ),
                  ),
                ],
              ),
              //avg Price
              isArabic()
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${hotelModel.roomsArabic![index]['averagePrice']} لليلة الواحدة ",
                    style: TextStyle(color: Colors.orange,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("${hotelModel.rooms![index]['averagePrice']} for 1 night",
                    style: TextStyle(color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: isArabic()? 14: 16
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
