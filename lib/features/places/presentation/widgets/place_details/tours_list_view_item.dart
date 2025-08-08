import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/tours/presentation/views/tour_details_view.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../core/utils/widgets/default_cached_network_image.dart';
import '../../../../tours/domain/entities/tour_entity.dart';

class ToursListViewItem extends StatelessWidget {
  const ToursListViewItem({
    super.key,
    required this.tour,
  });

  final TourEntity tour;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TourDetailsView(tourEntity: tour),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultCachedNetworkImage(
            imageUrl: tour.imageUrl,
            imageHeight: 150,
            imageWidth: 220,
          ),
          Positioned(
            bottom: 10,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              child: Text(
                tour.name,
                style: TextStyles.bold18.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
