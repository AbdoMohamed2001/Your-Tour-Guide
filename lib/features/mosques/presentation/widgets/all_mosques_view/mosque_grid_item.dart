import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';
import '../../../../../constants.dart';
import '../../views/moqsue_details_view.dart';
import 'mosque_grid_image.dart';

class MosqueGridItem extends StatelessWidget {
  const MosqueGridItem({
    Key? key,
    required this.mosqueEntity,
  }) : super(key: key);

  final MosqueEntity mosqueEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MosqueDetailsView(mosqueEntity: mosqueEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            MosqueGridImage(
              mosqueEntity: mosqueEntity,
            ),
          ],
        ),
      ),
    );
  }
}
