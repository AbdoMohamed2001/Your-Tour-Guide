import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/is_arabic.dart';
import '../../../../core/utils/functions/navigate_to_services_screen.dart';
import '../../../../core/utils/widgets/default_cached_network_image.dart';
import '../../../cities/domain/entities/city_services_entity.dart';

class CityServicesGridViewItem extends StatelessWidget {
  const CityServicesGridViewItem({
    Key? key,
    required this.cityServicesEntity,
  }) : super(key: key);

  final CityServicesEntity cityServicesEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToServiceScreen(cityServicesEntity.collectionRef, context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Stack(
                children: [
                  DefaultCachedNetworkImage(
                    imageUrl: cityServicesEntity.imageUrl,
                    imageHeight: 270,
                  ),
                  Positioned(
                    bottom: 15,
                    right: isArabic() ? 15 : null,
                    left: isArabic() ? null : 15,
                    child: BorderedText(
                      strokeWidth: 3,
                      child: Text(
                        isArabic()
                            ? cityServicesEntity.nameArabic
                            : cityServicesEntity.name,
                        style: TextStyles.bold18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
