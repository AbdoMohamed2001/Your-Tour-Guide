import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/data/models/place_model.dart';
import 'package:your_tour_guide/photo_single_view.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HowToGoWidget extends StatelessWidget {
  const HowToGoWidget({
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadText(text: S.of(context).HowToGo),
          kSizedBox,
          HeadText(text: S.current.metro),
          SizedBox(
            height: 5,
          ),
          Text(
            isArabic()
                ? placeModel.transportArabic!['metro']
                : placeModel.transport!['metro'],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
