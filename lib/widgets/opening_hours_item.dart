import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BuildOpeningHoursItem extends StatelessWidget {
  const BuildOpeningHoursItem({
    super.key,
    required this.openFrom,
    required this.openTo,
    @required this.place,
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
              HomeCubit.get(context).isDark! ?
                  isArabic() ? 'assets/images/openDarkArabic.png'
                      : 'assets/images/openDarkEnglish.png'

                  :
              isArabic() ? 'assets/images/openLightArabic.png' :
              'assets/images/openLightEnglish.png',
              width: 90,
              height: 90,
            ),
            Positioned(
              top: 13,
              right: isArabic() ? 20 : 0,
              left: isArabic() ? 0 : 16,
              child: Text(
                S.of(context).openingHours,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  S.of(context).From,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  openFrom,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(
                  S.of(context).To,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  openTo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
