import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_hero_transform/local_hero_transform.dart';
import 'package:your_tour_guide/core/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/functions/navigate_to_services_details_screen.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';

import '../../../../features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../theme/app_colors.dart';

class LocalHeroBody extends StatelessWidget {
  const LocalHeroBody({
    super.key,
    required this.tabController,
    required this.entities,
    this.isEvent = false,
    this.isTour = false,
    this.isFavEntity = false,
  });

  final TabController tabController;
  final List<dynamic> entities;
  final bool isEvent;
  final bool isTour;
  final bool isFavEntity;

  @override
  Widget build(BuildContext context) {
    return LocalHeroViews(
      onPressedCard: isFavEntity
          ? (index) async {
              await context.read<FavouriteCubit>().getEntity(entities[index]);
            }
          : (index) {
              navigateToServiceDetailsScreen(
                  entities[index].collectionRef, context, entities[index]);
            },
      textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
      itemCount: entities.length,
      itemsModel: (index) {
        final entity = entities[index];
        if (isEvent) {
          return buildEventItemModel(context, entity);
        }
        if (isTour) {
          return buildTourItemModel(context, entity);
        }
        return buildDefaultItemModel(context, entity);
      },
      tabController: tabController,
    );
  }
}

//-----------------------------------------------------------------------------

ItemsModel buildDefaultItemModel(BuildContext context, dynamic entity) {
  return ItemsModel(
    cardStyleMode: CardStyleMode(
      isDarkMode: context.read<HomeCubit>().isDarkMode,
      isLoading: false,
      cardColor: Theme.of(context).cardColor,
    ),
    image: DecorationImage(
      image: CachedNetworkImageProvider(entity.imageUrl),
      fit: BoxFit.cover,
    ),
    name: Text(
      isArabic() ? entity.nameArabic : entity.name,
      style: TextStyles.bold16,
    ),
    title: Text(
      isArabic() ? entity.cityNameArabic : entity.cityName,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    subTitle: Text(entity.rate.toString()),
    subTitleIcon: Icon(
      Icons.star,
      color: AppColors.primaryColor,
      size: MediaQuery.sizeOf(context).width * 0.03,
    ),
    favoriteIconButton: SizedBox(),
  );
}

ItemsModel buildEventItemModel(BuildContext context, dynamic entity) {
  return ItemsModel(
    cardStyleMode: CardStyleMode(
      isDarkMode: context.read<HomeCubit>().isDarkMode,
      isLoading: false,
      cardColor: Theme.of(context).cardColor,
    ),
    image: DecorationImage(
      image: CachedNetworkImageProvider(entity.imageUrl),
      fit: BoxFit.cover,
    ),
    name: Text(
      isArabic() ? entity.nameArabic : entity.name,
      style: TextStyles.bold16,
    ),
    title: Text(
      isArabic() ? entity.locationArabic : entity.location,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    subTitle: Text(
      entity.organizer,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    favoriteIconButton: SizedBox(),
  );
}

ItemsModel buildTourItemModel(BuildContext context, dynamic entity) {
  return ItemsModel(
    cardStyleMode: CardStyleMode(
      isDarkMode: context.read<HomeCubit>().isDarkMode,
      isLoading: false,
      cardColor: Theme.of(context).cardColor,
    ),
    image: DecorationImage(
      image: CachedNetworkImageProvider(entity.imageUrl),
      fit: BoxFit.cover,
    ),
    name: Text(
      isArabic() ? entity.nameArabic : entity.name,
      style: TextStyles.bold16,
    ),
    title: Text(
      isArabic() ? entity.tourLocationArabic : entity.tourLocation,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    subTitle: Text(
      entity.startPrice,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    favoriteIconButton: SizedBox(),
  );
}
