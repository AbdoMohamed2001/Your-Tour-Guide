import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';

import '../../../../constants.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/deafult_cached_network_image.dart';

class FeatureDetailsListViewItem extends StatelessWidget {
  const FeatureDetailsListViewItem({
    super.key,
    required this.featureEntity,
  });

  final FeatureEntity featureEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return pushedPage;
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: Stack(
              children: [
                DefaultCachedNetworkImage(
                    imageUrl: featureEntity.imageUrl, imageHeight: 200),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      strokeJoin: StrokeJoin.bevel,
                      child: Text(
                        textAlign: TextAlign.center,
                        isArabic()
                            ? featureEntity.nameArabic
                            : featureEntity.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //Done
              ],
            ),
          ),
        ),
      ),
    );
  }
}
