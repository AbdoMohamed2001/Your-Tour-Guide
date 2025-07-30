import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_tour_guide/core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/profile_view_entity.dart';

class ProfileListItemWithArrowIcon extends StatelessWidget {
  const ProfileListItemWithArrowIcon({
    super.key,
    required this.image,
    required this.text,
    required this.pageName,
  });
//
  final String image;
  final String text;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (pageName == '/personal_user_data') {
        //   Navigator.pushNamed(
        //     context,
        //     pageName,
        //     arguments: context.read<ProfileCubit>(),
        //   );
        // }
        // Navigator.pushNamed(
        //   context,
        //   pageName,
        //   arguments: context.read<ProductsCubit>(),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
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
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

List profileListWithArrowIcon(BuildContext context) {
  return [
    ProfileViewEntity(
      text: S.of(context).personalProfile,
      icon: Assets.iconsSettingIcon,
      // icon: Assets.outlinedUserOutlined,
      nextPageName: '/personal_user_data',
    ),
    ProfileViewEntity(
      text: S.of(context).Favourite,
      icon: Assets.iconsHeart,
      // icon: Assets.imagesHeart,
      nextPageName: '/favourites',
    ),
  ];
}

//--------------------------------------------------------------------------
class ProfileListItemWithoutArrowIcon extends StatelessWidget {
  const ProfileListItemWithoutArrowIcon({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
          Text(text, style: TextStyles.regular14),
          Spacer(),
          // CustomSwitch(),
        ],
      ),
    );
  }
}

List profileListWithoutIcon(BuildContext context) {
  return [
    ProfileViewEntity(
      text: S.of(context).notifications,
      icon: Assets.iconsNotification,
    ),
    ProfileViewEntity(
      text: S.of(context).language,
      icon: Assets.iconsGlobal,

      // icon: Assets.imagesGlobal,
    ),
    ProfileViewEntity(
      text: S.of(context).mode,
      icon: Assets.iconsMagicpen,
      // icon: Assets.imagesMagicpen,
    ),
  ];
}
