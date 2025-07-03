import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../cubits/home/home_cubit.dart';

class CafeGridImage extends StatelessWidget {
  const CafeGridImage({
    super.key,
    required this.cafeEntity,
  });

  final CafeEntity cafeEntity;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: cafeEntity.imageUrl,
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
                isArabic() ? cafeEntity.nameArabic : cafeEntity.name,
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
                isArabic() ? cafeEntity.cityNameArabic : cafeEntity.cityName,
                style: TextStyles.bold14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
