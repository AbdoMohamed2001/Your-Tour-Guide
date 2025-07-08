import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/malls/domain/entities/mall_entity.dart';
import '../../../../../core/cubits/home/home_cubit.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/text_styles.dart';

class MallGridImage extends StatelessWidget {
  const MallGridImage({
    super.key,
    required this.mallEntity,
  });

  final MallEntity mallEntity;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: mallEntity.imageUrl,
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
                isArabic() ? mallEntity.nameArabic : mallEntity.name,
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
                isArabic() ? mallEntity.cityNameArabic : mallEntity.cityName,
                style: TextStyles.bold14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
