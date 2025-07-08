import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/malls/domain/entities/mall_entity.dart';
import '../../../../../constants.dart';
import '../../views/mall_details_view.dart';
import 'mall_grid_image.dart';

class MallGridItem extends StatelessWidget {
  const MallGridItem({
    Key? key,
    required this.mallEntity,
  }) : super(key: key);

  final MallEntity mallEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MallDetailsView(mallEntity: mallEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            MallGridImage(
              mallEntity: mallEntity,
            ),
          ],
        ),
      ),
    );
  }
}
