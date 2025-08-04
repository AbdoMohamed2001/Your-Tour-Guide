import 'package:your_tour_guide/generated/assets.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../cubits/theme/theme_cubit.dart';
import '../../services/get_it_services_locator.dart';
import '../functions/is_arabic.dart';
import '../theme/text_styles.dart';

class OpeningHoursWidget extends StatelessWidget {
  const OpeningHoursWidget({
    super.key,
    required this.openFrom,
    required this.openTo,
  });

  final String openFrom;
  final String openTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(
              getIt<ThemeCubit>().isDarkMode
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
