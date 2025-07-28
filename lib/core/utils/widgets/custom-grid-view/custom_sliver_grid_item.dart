import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/navigate_to_services_details_screen.dart';

import '../../../../features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../app_colors.dart';
import '../../functions/is_arabic.dart';
import '../../text_styles.dart';
import 'custom_sliver_grid_item_image.dart';

class CustomSliverGridItem extends StatelessWidget {
  const CustomSliverGridItem({
    Key? key,
    required this.entity,
    this.isFavEntity = false,
  }) : super(key: key);

  final dynamic entity;
  final bool isFavEntity;

  @override
  Widget build(BuildContext context) {
    return isFavEntity
        ? GestureDetector(
            onTap: () async {
              await context.read<FavouriteCubit>().getEntity(entity);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image Container with Fixed Height
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomSliverGridImage(
                          entity: entity,
                        ),
                      ),
                    ),
                  ),

                  // Content Container with Fixed Height
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Restaurant Name
                          Text(
                            isArabic()
                                ? entity.nameArabic
                                : entity.name ?? 'Restaurant',
                            style: TextStyles.bold16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            isArabic()
                                ? entity.cityNameArabic
                                : entity.cityName ?? '',
                            style: TextStyles.bold16
                                .copyWith(color: AppColors.primaryColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4),

                          // Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (entity.rate != null)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      entity.rate!.toString(),
                                      style: TextStyles.bold12,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        //---------------------------------------------------------
        : GestureDetector(
            onTap: () {
              navigateToServiceDetailsScreen(
                  entity.collectionRef, context, entity);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image Container with Fixed Height
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomSliverGridImage(
                          entity: entity,
                        ),
                      ),
                    ),
                  ),

                  // Content Container with Fixed Height
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Restaurant Name
                          Text(
                            isArabic()
                                ? entity.nameArabic
                                : entity.name ?? 'Restaurant',
                            style: TextStyles.bold16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            isArabic()
                                ? entity.cityNameArabic
                                : entity.cityName ?? '',
                            style: TextStyles.bold16
                                .copyWith(color: AppColors.primaryColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4),

                          // Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (entity.rate != null)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      entity.rate!.toString(),
                                      style: TextStyles.bold12,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
