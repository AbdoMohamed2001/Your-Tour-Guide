import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
    required this.starIconIncluded,
  });

  final num? rate;
  final bool? starIconIncluded;

  Widget build(BuildContext context) {
    return Row(
      children: [
        starIconIncluded == true
            ? Icon(
                FontAwesomeIcons.star,
                size: 24,
              )
            : Container(),
        starIconIncluded == true
            ? SizedBox(
                width: 10,
              )
            : Container(),
        BorderedText(
          strokeColor: Colors.black,
          strokeWidth: 2,
          child: Text(
            '($rate)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        RatingBar(
            ignoreGestures: true,
            itemSize: 24,
            initialRating: rate!.toDouble() == 4.6 || rate!.toDouble() == 4.7
                ? 4.5
                : rate!.toDouble(),
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
      ],
    );
  }
}
