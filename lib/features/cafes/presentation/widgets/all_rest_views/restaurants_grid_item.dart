import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import '../../../../../constants.dart';
import '../../views/cafe_details_view.dart';
import 'cafe_grid_image.dart';

class CafeGridItem extends StatelessWidget {
  const CafeGridItem({
    Key? key,
    required this.cafeEntity,
  }) : super(key: key);

  final CafeEntity cafeEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CafeDetailsView(
              cafeEntity: cafeEntity,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            CafeGridImage(
              cafeEntity: cafeEntity,
            ),
          ],
        ),
      ),
    );
  }
}
