import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/utils.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    Key? key,
    required this.mallModel,
    required this.index,
  }) : super(key: key);
  final MallModel mallModel;
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
                      color: HomeCubit.get(context).isDark!
                          ? Colors.white
                          : Colors.black,
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
                  //           ? mallModel.storeArabic![index]['name']
                  //           : mallModel.store![index]['name'],
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
                  BuildOpeningHoursItem(
                    openFrom: isArabic()
                        ? mallModel.openingHoursArabic!['from']
                        : mallModel.openingHours!['from'],
                    openTo: isArabic()
                        ? mallModel.openingHoursArabic!['to']
                        : mallModel.openingHours!['to'],
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
                  //       ? mallModel.storeArabic![index]['mobile']
                  //       : mallModel.store![index]['mobile'],
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
