import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturesGridViewItem extends StatelessWidget {
  final Color boxDecorationColor;
  final String text;
  final void Function()? onPressed;
  final String fileName;

  FeaturesGridViewItem({
    Key? key,
    required this.onPressed,
    required this.boxDecorationColor,
    required this.text,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(width: 0.9),
          color: boxDecorationColor,
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Icon
              SvgPicture.asset(
                fileName,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 50,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyles.bold16.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
