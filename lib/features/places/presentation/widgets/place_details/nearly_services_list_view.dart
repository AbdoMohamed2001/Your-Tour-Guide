import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/place/nearly_item.dart';
import '../../../domain/entities/nearly_place_entity.dart';

class NearlyServicesListView extends StatelessWidget {
  const NearlyServicesListView({
    super.key,
    this.cityName,
  });
  final String? cityName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => NearlyPlaceItem(
          containerColor: getNearlyList(context)[index].containerColor,
          iconName: getNearlyList(context)[index].iconName,
          iconColor: getNearlyList(context)[index].iconColor,
          containerName: getNearlyList(context)[index].containerName,
          pushedPage:
              getNearlyList(context, cityName: cityName)[index].pushedPage,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 4,
      ),
    );
  }
}
