import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceProviderItem extends StatelessWidget {
  final double? width;
  final double? height;
  final Color boxDecorationColor;
  final String text;
  final void Function()? onPressed;
  final String fileName;

  ServiceProviderItem({
    Key? key,
    this.height,
    this.width,
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
          border: Border.all(
            color:
                HomeCubit.get(context).isDark! ? Colors.grey : Colors.black26,
            width: 0.9,
          ),
          color: boxDecorationColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Icon
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/$fileName.svg',
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 50,
                ),
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
