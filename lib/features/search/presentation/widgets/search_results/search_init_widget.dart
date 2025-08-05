import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:your_tour_guide/generated/assets.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../generated/l10n.dart';

class SearchInitialWidget extends StatelessWidget {
  const SearchInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesSearch,
            height: 240,
          ),
          // Icon(
          //   Icons.search,
          //   size: 64,
          //   color: AppColors.primaryColor,
          // ),
          Text(
            S.of(context).startSearch,
            style: TextStyles.bold24.copyWith(
              color: AppColors.primaryColor,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
