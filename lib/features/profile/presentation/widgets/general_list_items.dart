import 'package:flutter/material.dart';
import '../../../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/profile_view_entity.dart';

List<ProfileViewEntity> generalList(BuildContext context) => [
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
