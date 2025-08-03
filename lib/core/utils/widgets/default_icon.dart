import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';

class DefaultIcon extends StatelessWidget {
  const DefaultIcon({
    super.key,
    required this.icon,
    this.radius = 22,
    this.onTap,
  });
  final Widget icon;
  final double? radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryColor,
      child: InkWell(
        onTap: onTap,
        child: icon,
      ),
    );
  }
}
