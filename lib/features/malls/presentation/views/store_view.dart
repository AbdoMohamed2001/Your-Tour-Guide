import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:your_tour_guide/core/utils/widgets/none_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/mall_entity.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    Key? key,
    required this.mallEntity,
    required this.index,
  }) : super(key: key);
  final MallEntity mallEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoneAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Stack(
              children: [
                DefaultCachedNetworkImage(
                  imageUrl:
                      'https://therockbury.com/wp-content/uploads/2014/03/HM-logo.jpg',
                  imageHeight: 500,
                ),
                Positioned(
                  top: 10,
                  child: IconButton(
                    onPressed: () async {
                      Navigator.pop(context, true);
                    },
                    icon: Icon(
                      isArabic()
                          ? FontAwesomeIcons.chevronRight
                          : FontAwesomeIcons.chevronLeft,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            //----------------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and rate
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       isArabic()
                  //           ? mallEntity.storeArabic![index]['name']
                  //           : mallEntity.store![index]['name'],
                  //       style: TextStyle(fontSize: 26),
                  //     ),
                  //     Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(bottom: 5.0),
                  //           child: Icon(
                  //             Icons.star,
                  //             color: Colors.orange,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  kSizedBox,
                  //Opening Hours
                  OpeningHoursWidget(
                    openFrom: isArabic()
                        ? mallEntity.openingHoursArabic['from']
                        : mallEntity.openingHours['from'],
                    openTo: isArabic()
                        ? mallEntity.openingHoursArabic['to']
                        : mallEntity.openingHours['to'],
                  ),
                  kSizedBox,
                  Divider(
                    color: Colors.white,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //Mobile
                  // Text(
                  //   isArabic()
                  //       ? mallEntity.storeArabic![index]['mobile']
                  //       : mallEntity.store![index]['mobile'],
                  //   style: TextStyle(fontSize: 16,),
                  // ),
                  kSizedBox,
                  HeadText(text: 'Social Media'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.facebookSquare,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
