import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants.dart' show kHorizontalPadding;
import '../../cubits/home/home_cubit.dart';
import '../functions/is_arabic.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem(
      {super.key,
      required this.imageUrl,
      required this.imageHeight,
      required this.name,
      required this.cityName,
      required this.stars});

  final String imageUrl;
  final String name, cityName;
  final double imageHeight, stars;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    height: imageHeight,
                  ),
                  Positioned(
                    bottom: 50,
                    right: isArabic() ? 5 : null,
                    left: isArabic() ? null : 5,
                    child: BorderedText(
                      strokeWidth: 3,
                      strokeColor: HomeCubit.get(context).isDark!
                          ? Colors.black
                          : Colors.white,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    // top: screenHeight * 0.310,
                    right: isArabic() ? 8 : null,
                    left: isArabic() ? null : 8,
                    child: BorderedText(
                      strokeWidth: 3,
                      strokeColor: HomeCubit.get(context).isDark!
                          ? Colors.black
                          : Colors.white,
                      child: Text(
                        cityName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    // top: screenHeight * 0.34,
                    right: isArabic() ? 8 : null,
                    left: isArabic() ? null : 8,
                    child: RatingBar(
                        textDirection:
                            isArabic() ? TextDirection.rtl : TextDirection.ltr,
                        ignoreGestures: true,
                        itemSize: 24,
                        initialRating: stars,
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
            ),
            SizedBox(
              height: 0.02,
            ),
            //HotelFeatures
          ],
        ),
      ),
    );
  }
}
