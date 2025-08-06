import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/functions/navigate_to_services_screen.dart';
import '../../../../../core/utils/widgets/default_cached_network_image.dart';
import '../../../domain/entities/city_services_entity.dart';

class CityServicesGridViewItem extends StatelessWidget {
  const CityServicesGridViewItem({
    Key? key,
    required this.cityServicesEntity,
    required this.cityName,
  }) : super(key: key);

  final CityServicesEntity cityServicesEntity;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToServiceScreen(
          cityServicesEntity.collectionRef,
          context,
          cityName: cityName,
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            DefaultCachedNetworkImage(
              imageUrl: cityServicesEntity.imageUrl,
              imageHeight: 270,
            ),
            Positioned(
              bottom: 20,
              right: isArabic() ? 15 : null,
              left: isArabic() ? null : 15,
              child: BorderedText(
                strokeWidth: 2,
                strokeColor: Colors.black,
                child: Text(
                  isArabic()
                      ? cityServicesEntity.nameArabic
                      : cityServicesEntity.name,
                  style: TextStyles.bold18.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
