import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/navigate_to_services_details_screen.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tours_view/tour_grid_item.dart';
import '../../../../features/events/presentation/widgets/all_events_view/event_grid_item.dart';
import '../../../../features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../../../features/tours/presentation/widgets/tour_types_view/tour_type_grid_item.dart';
import '../../app_colors.dart';
import '../../functions/is_arabic.dart';
import '../../text_styles.dart';
import 'custom_sliver_grid_item_image.dart';

class CustomSliverGridItem extends StatelessWidget {
  const CustomSliverGridItem({
    Key? key,
    required this.entity,
    this.isFavEntity = false,
    this.isEvent = false,
    this.isTour = false,
    this.isTourType = false,
  }) : super(key: key);

  final dynamic entity;
  final bool isFavEntity;
  final bool isEvent;
  final bool isTourType;
  final bool isTour;

  @override
  Widget build(BuildContext context) {
    if (isEvent) {
      return EventGridItem(entity: entity);
    } else if (isTourType) {
      return TourTypeGridItem(entity: entity);
    } else if (isTour) {
      return TourGridItem(entity: entity);
    }
    return GestureDetector(
      onTap: isFavEntity
          ? () async {
              await context.read<FavouriteCubit>().getEntity(entity);
            }
          : () {
              navigateToServiceDetailsScreen(
                  entity.collectionRef, context, entity);
            },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomSliverGridImage(entity: entity),
                ),
              ),
            ),
            // Content Container with Fixed Height
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      isArabic()
                          ? entity.nameArabic ?? 'NameArabic'
                          : entity.name ?? 'Name',
                      style: TextStyles.bold16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    //Location
                    Text(
                      isArabic()
                          ? entity.cityNameArabic ?? ''
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
//isEvent => EventGridItem
//isTour => TourEventItem
