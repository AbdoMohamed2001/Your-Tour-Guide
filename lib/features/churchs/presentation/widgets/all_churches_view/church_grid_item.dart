import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../domain/entities/church_entity.dart';
import '../../views/church_details_view.dart';
import 'church_grid_image.dart';

class ChurchGridItem extends StatelessWidget {
  const ChurchGridItem({
    Key? key,
    required this.churchEntity,
  }) : super(key: key);

  final ChurchEntity churchEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChurchDetailsView(churchEntity: churchEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            ChurchGridImage(
              churchEntity: churchEntity,
            ),
          ],
        ),
      ),
    );
  }
}
