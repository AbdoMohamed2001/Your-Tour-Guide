import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/tours/presentation/views/tours_view.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../core/utils/widgets/custom-grid-view/custom_sliver_grid_item_image.dart';
import '../../../domain/entities/tour_type_entity.dart';

class TourTypeGridItem extends StatelessWidget {
  const TourTypeGridItem({super.key, required this.entity});

  final TourTypeEntity entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ToursView(tourType: entity.id)));
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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
