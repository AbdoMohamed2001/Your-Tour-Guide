import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import '../../../../../core/cubits/home/home_cubit.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/text_styles.dart';

class RestGridImage extends StatelessWidget {
  const RestGridImage({
    super.key,
    required this.restaurantEntity,
  });

  final RestaurantEntity restaurantEntity;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: restaurantEntity.imageUrl,
            fit: BoxFit.cover,
            height: screenHeight * 0.45,
          ),
          //Name
          Positioned(
            bottom: 50,
            right: isArabic() ? 5 : null,
            left: isArabic() ? null : 5,
            child: BorderedText(
              strokeWidth: 3,
              strokeColor:
                  HomeCubit.get(context).isDark! ? Colors.black : Colors.white,
              child: Text(
                isArabic()
                    ? restaurantEntity.nameArabic
                    : restaurantEntity.name,
                style: TextStyles.bold14,
              ),
            ),
          ),
          //CityName
          Positioned(
            bottom: 30,
            // top: screenHeight * 0.310,
            right: isArabic() ? 8 : null,
            left: isArabic() ? null : 8,
            child: BorderedText(
              strokeWidth: 3,
              strokeColor:
                  HomeCubit.get(context).isDark! ? Colors.black : Colors.white,
              child: Text(
                isArabic()
                    ? restaurantEntity.cityNameArabic
                    : restaurantEntity.cityName,
                style: TextStyles.bold14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
