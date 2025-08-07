import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';

import '../../../../../core/utils/theme/text_styles.dart';

class MenuTypesItem extends StatelessWidget {
  const MenuTypesItem({
    super.key,
    required this.type,
    this.width,
    this.onTap,
    this.isSelected = false,
  });

  final String type;
  final double? width;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isSelected ? AppColors.primaryColor : Theme.of(context).cardColor,
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyles.bold16,
          ),
        ),
      ),
    );
  }
}
