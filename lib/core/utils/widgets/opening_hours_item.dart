import 'package:your_tour_guide/generated/assets.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../cubits/home/home_cubit.dart';
import '../functions/is_arabic.dart';
import '../text_styles.dart';

class OpeningHoursWidget extends StatelessWidget {
  const OpeningHoursWidget({
    super.key,
    required this.openFrom,
    required this.openTo,
    this.place,
  });

  final String openFrom;
  final String openTo;
  final QueryDocumentSnapshot<Object?>? place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(
              HomeCubit.get(context).isDarkMode
                  ? isArabic()
                      ? Assets.imagesOpenDarkArabic
                      : Assets.imagesOpenDarkEnglish
                  : isArabic()
                      ? Assets.imagesOpenLightArabic
                      : Assets.imagesOpenLightEnglish,
              width: 90,
              height: 90,
            ),
            Positioned(
              top: isArabic() ? 20 : 20,
              right: isArabic() ? 20 : 0,
              left: isArabic() ? 0 : 16,
              child: Text(
                S.of(context).openingHours,
                style: TextStyles.bold16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  S.of(context).From,
                  style: TextStyles.bold18,
                ),
                Text(
                  openFrom,
                  style: TextStyles.regular18,
                ),
              ],
            ),
            SizedBox(width: 30),
            Column(
              children: [
                Text(
                  S.of(context).To,
                  style: TextStyles.bold18,
                ),
                Text(
                  openTo,
                  style: TextStyles.regular18,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
