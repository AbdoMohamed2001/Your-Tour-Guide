import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/cinema_entity.dart';
import '../../../../../constants.dart';
import '../../views/cinema_details_view.dart';
import 'cinema_grid_image.dart';

class CinemaGridItem extends StatelessWidget {
  const CinemaGridItem({
    Key? key,
    required this.cinemaEntity,
  }) : super(key: key);

  final CinemaEntity cinemaEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CinemaDetailsView(cinemaEntity: cinemaEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            CinemaGridImage(
              cinemaEntity: cinemaEntity,
            ),
          ],
        ),
      ),
    );
  }
}
