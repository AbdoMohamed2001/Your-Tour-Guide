import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
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
            width: screenWidth * 0.48,
            height: screenHeight * 0.47,
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(
                width: 0.1,
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                //---------------------------------------------------------------------
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DefaultCachedNetworkImage(
                    imageUrl: placeEntity.imageUrl,
                    imageHeight: 100,
                    imageWidth: 250,
                  ),
                ),
                kSizedBox,
                //---------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic() ? placeEntity.nameArabic : placeEntity.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
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
                          SizedBox(
                            width: 5,
                          ),
                          isArabic()
                              ? Text(
                                  '(${arabicNumber.convert(placeEntity.rate.toString())})')
                              : Text('(${placeEntity.rate.toString()})'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      )
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
