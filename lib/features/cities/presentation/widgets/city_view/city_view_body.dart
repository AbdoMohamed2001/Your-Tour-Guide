import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/features/cities/domain/entities/city_entity.dart';

import 'city_services_grid_view_item.dart';

class CityViewBody extends StatelessWidget {
  const CityViewBody({super.key, required this.cityEntity});
  final CityEntity cityEntity;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      itemCount: cityEntity.services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.1 / 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, i) => CityServicesGridViewItem(
        cityServicesEntity: cityEntity.services[i],
        cityName: cityEntity.name,
      ),
    );
  }
}
