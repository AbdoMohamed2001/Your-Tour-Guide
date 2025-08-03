import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_hero_transform/local_hero_transform.dart';
import 'package:your_tour_guide/core/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';

import '../../app_colors.dart';
import '../../functions/navigate_to_services_details_screen.dart';

class LocalHeroView extends StatelessWidget {
  const LocalHeroView(
      {super.key, required this.tabController, required this.itemsMode});

  final TabController tabController;
  final List<dynamic> itemsMode;

  @override
  Widget build(BuildContext context) {
    return LocalHeroViews(
      tabController: tabController,
      textDirection: TextDirection.ltr,
      itemCount: itemsMode.length,
      itemsModel: (index) => ItemsModel(
        name: Text(
          itemsMode[index].name,
          style: TextStyles.bold16,
        ),
        cardStyleMode: CardStyleMode(
          isDarkMode: context.read<HomeCubit>().isDarkMode,
          cardColor: Theme.of(context).cardColor,
        ),
        subTitleIcon: const Icon(
          Icons.star,
          size: 16,
          color: Colors.amber,
        ),
        title: Text(
          itemsMode[index].cityName,
          style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
        ),
        subTitle: Text(
          itemsMode[index].rate.toString(),
          style: TextStyles.bold12,
        ),
        favoriteIconButton: SizedBox(),
        image: DecorationImage(image: NetworkImage(itemsMode[index].imageUrl)),
      ),
      onPressedCard: (int index) {
        navigateToServiceDetailsScreen(
            itemsMode[index].collectionRef, context, itemsMode[index]);
      },
    );
  }
}
