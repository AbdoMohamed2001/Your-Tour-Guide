import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceProviderItem extends StatelessWidget {
  final double? width;
  final double? height;
  final Color boxDecorationColor;
  final double boxDecorationBorderRadius;
  final String text;
  final void Function()? onPressed;
  final String fileName;

  ServiceProviderItem({
    Key? key,
    this.height,
    this.width,
    required this.onPressed,
    required this.boxDecorationColor,
    required this.boxDecorationBorderRadius,
    required this.text,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(
            color: HomeCubit.get(context).isDark! ? Colors.grey : Colors.black26,
            width: 0.9,
          ),
          color: boxDecorationColor,
          borderRadius:
          BorderRadius.all(Radius.circular(boxDecorationBorderRadius)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Icon
              Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 80,
                  decoration:  BoxDecoration(
                    color: isDarkMode ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: SvgPicture.asset(
                      'assets/icons/$fileName.svg',
                  fit: BoxFit.cover,
                    color: isDarkMode ? Colors.white :Colors.black,
                    width: 50,

                  ),

              ),

                  //IconButton(
                //                     icon: SvgPicture.asset(
                //                       'assets/icons/$fileName.svg',
                //                       fit: BoxFit.cover,
                //                       // ignore: deprecated_member_use
                //                       color: isDarkMode ? Colors.white :Colors.black,
                //
                //                     ),
                //                     onPressed: () {},
                //                     iconSize: 50,
                //                   ),

              //Text
              Text(
                text,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: Colors.white,
                  // color: Theme.of(context).primaryColor,
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
