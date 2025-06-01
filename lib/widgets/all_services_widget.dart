import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AllFeaturesGridView extends StatelessWidget {
  final List<QueryDocumentSnapshot>? allDocs;
  final int index;
  final Widget pushedPage;
  final String itemNameOnFireBase;
  final String imageUrl;
  AllFeaturesGridView({
    Key? key,
    required this.index,
    @required this.allDocs,
    required this.pushedPage,
    required this.itemNameOnFireBase,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    DefaultCachedNetworkImage(
                      imageUrl: imageUrl,
                      imageHeight: 220,
                    ),
                    Positioned(
                      top: 165,
                      right: isArabic() ? 12 : null,
                      left: isArabic() ? null : 12,
                      child: BorderedText(
                        strokeWidth: 4,
                        strokeColor: HomeCubit.get(context).isDark!
                            ? Colors.black
                            : Colors.white,
                        child: Text(
                          isArabic()
                              ? allDocs![index]['nameArabic']
                              : allDocs![index]['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 165,
                      right: isArabic() ? 360 : null,
                      left: isArabic() ? null : 360,
                      child: BorderedText(
                        strokeWidth: 4,
                        strokeColor: HomeCubit.get(context).isDark!
                            ? Colors.black
                            : Colors.white,
                        child: Text(
                          isArabic()
                              ? allDocs![index]['rate'].toString()
                              : allDocs![index]['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //Done
                  ],
                ),
                kSizedBox,
                //-------------------------------------------------------------
                //name and rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // textAlign: TextAlign.center,
                      isArabic()
                          ? '${allDocs![index]['cityNameArabic']}'
                          : '${allDocs![index]['cityName']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RateWidget(
                      rate: allDocs![index]['rate'],
                      starIconIncluded: false,
                    ),
                  ],
                ),
                //-------------------------------------------------------------
                //address
                isArabic()
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          allDocs![index]['addressArabic'],
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(allDocs![index]['address'])),
                kSizedBox,
                //-------------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
