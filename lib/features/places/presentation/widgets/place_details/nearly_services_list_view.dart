import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/place/nearly_item.dart';
import '../../../domian/entities/nearly_place_entity.dart';

class NearlyServicesListView extends StatelessWidget {
  const NearlyServicesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => NearlyPlaceItem(
          containerColor: nearlyList[index].containerColor,
          iconName: nearlyList[index].iconName,
          iconColor: nearlyList[index].iconColor,
          containerName: nearlyList[index].containerName,
          pushedPage: nearlyList[index].pushedPage,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 4,
      ),
    );
  }
}
