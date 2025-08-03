import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/theme/text_styles.dart';
import '../../../domain/entities/hotel_entity.dart';

class HotelGridImage extends StatelessWidget {
  const HotelGridImage({
    super.key,
    required this.hotelEntity,
    required this.screenHeight,
  });

  final HotelEntity hotelEntity;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: hotelEntity.imageUrl,
            fit: BoxFit.cover,
            height: screenHeight * 0.33,
          ),
          //Name
          Positioned(
            bottom: 50,
            right: isArabic() ? 5 : null,
            left: isArabic() ? null : 5,
            child: BorderedText(
              strokeWidth: 3,
              child: Text(
                isArabic() ? hotelEntity.nameArabic : hotelEntity.name,
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
                isArabic() ? hotelEntity.cityNameArabic : hotelEntity.cityName,
                style: TextStyles.bold14,
              ),
            ),
          ),
          //Stars
          Positioned(
            bottom: 10,
            right: isArabic() ? 8 : null,
            left: isArabic() ? null : 8,
            child: RatingBar(
                textDirection:
                    isArabic() ? TextDirection.rtl : TextDirection.ltr,
                ignoreGestures: true,
                itemSize: 24,
                initialRating: hotelEntity.stars.toDouble(),
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                  full: Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                  empty: Container(),
                ),
                onRatingUpdate: (rating) {}),
          ),
        ],
      ),
    );
  }
}
