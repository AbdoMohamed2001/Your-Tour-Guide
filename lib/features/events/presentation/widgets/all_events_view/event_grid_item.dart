import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/functions/navigate_to_services_details_screen.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/custom-grid-view/custom_sliver_grid_item_image.dart';
import '../../../domain/entities/event_entity.dart';

class EventGridItem extends StatelessWidget {
  const EventGridItem({super.key, required this.entity});

  final EventEntity entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToServiceDetailsScreen(entity.collectionRef, context, entity);
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
                  child: CustomSliverGridImage(entity: entity),
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
                    // Name
                    Text(
                      isArabic() ? entity.nameArabic : entity.name,
                      style: TextStyles.bold16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //Location
                    Text(
                      isArabic() ? entity.locationArabic : entity.location,
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.primaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),
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
