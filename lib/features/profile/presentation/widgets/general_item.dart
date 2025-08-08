import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_pop_up_menu.dart';
import 'package:your_tour_guide/features/profile/presentation/widgets/custom_switch.dart';
import '../../../../core/cubits/locale_cubit/locale_cubit.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/text_styles.dart';

class GeneralItem extends StatelessWidget {
  const GeneralItem({
    super.key,
    required this.image,
    required this.text,
    this.containsArrow = false,
    this.isLanguage = false,
    this.isCustomSwitch = false,
    this.onTap,
  });

//
  final String image;
  final String text;
  final bool containsArrow;
  final bool isLanguage;
  final bool isCustomSwitch;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 9),
            Text(
              text,
              style: TextStyles.regular14,
            ),
            Spacer(),
            containsArrow
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor,
                    size: 20,
                  )
                : SizedBox(),
            isLanguage
                ? CustomPopUpMenu(
                    onSelected: (langCode) {
                      getIt<LocaleCubit>().changeLanguage(langCode);
                    },
                    currentLanguageCode:
                        getIt<LocaleCubit>().currentLocale.languageCode,
                    icon: Row(
                      children: [
                        Text(
                          getIt<LocaleCubit>()
                              .currentLocale
                              .languageCode
                              .toUpperCase(),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            isCustomSwitch ? CustomSwitch() : SizedBox()
          ],
        ),
      ),
    );
  }
}
