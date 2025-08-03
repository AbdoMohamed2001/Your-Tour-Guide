import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';

import '../theme/text_styles.dart';

class CombinedText extends StatelessWidget {
  const CombinedText({
    super.key,
    required this.firstText,
    this.onTap,
    required this.secondText,
  });
  final String firstText;
  final String secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style: TextStyles.bold16.copyWith(color: Color(0xff616A6B)),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              secondText,
              style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
