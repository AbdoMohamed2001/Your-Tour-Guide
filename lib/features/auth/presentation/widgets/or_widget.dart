import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/app_colors.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 2,
            color: AppColors.primaryColor,
            thickness: 1,
            endIndent: 4,
            indent: 25,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Divider(
            height: 2,
            color: AppColors.primaryColor,
            thickness: 1,
            endIndent: 25,
            indent: 4,
          ),
        ),
      ],
    );
  }
}
