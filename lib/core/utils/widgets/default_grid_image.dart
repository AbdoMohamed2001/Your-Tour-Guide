import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../functions/is_arabic.dart';
import '../text_styles.dart';

class DefaultGridImage extends StatelessWidget {
  const DefaultGridImage({super.key, this.entity});
  final dynamic entity;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: entity.imageUrl,
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
              child: Text(
                isArabic() ? entity.nameArabic : entity.name,
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
              child: Text(
                isArabic() ? entity.cityNameArabic : entity.cityName,
                style: TextStyles.bold14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
