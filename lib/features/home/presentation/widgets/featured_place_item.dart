import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';
import 'package:your_tour_guide/features/places/presentation/views/place_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';

class FeaturedPlaceItem extends StatelessWidget {
  const FeaturedPlaceItem({
    super.key,
    required this.placeEntity,
  });

  final PlaceEntity placeEntity;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final arabicNumber = ArabicNumbers();
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlaceDetailsView(
                placeEntity: placeEntity,
              );
            }));
          },
          child: Container(
            width: screenWidth * 0.45,
            height: screenHeight * 0.47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius8),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                //---------------------------------------------------------------------
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: DefaultCachedNetworkImage(
                    imageUrl: placeEntity.imageUrl,
                    imageHeight: 100,
                    imageWidth: 250,
                  ),
                ),
                kSizedBox,
                //---------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic() ? placeEntity.nameArabic : placeEntity.name,
                        style: TextStyles.bold16,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          RatingBar(
                              ignoreGestures: true,
                              itemSize: 16,
                              initialRating: placeEntity.rate.toDouble(),
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
                                empty: Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.orange,
                                ),
                              ),
                              onRatingUpdate: (rating) {}),
                          SizedBox(width: 5),
                          isArabic()
                              ? Text(
                                  '(${arabicNumber.convert(placeEntity.rate.toString())})')
                              : Text('(${placeEntity.rate.toString()})'),
                        ],
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
