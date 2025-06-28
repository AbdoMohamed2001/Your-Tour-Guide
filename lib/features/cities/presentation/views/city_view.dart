import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/features/cities/domain/entities/city_entity.dart';
import 'package:your_tour_guide/features/cities/presentation/widgets/city_services_grid_view_item.dart';

class CityView extends StatelessWidget {
  CityView({
    Key? key,
    required this.cityEntity,
  }) : super(key: key);
  static String id = 'CityView';
  final CityEntity cityEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isArabic() ? cityEntity.nameArabic : cityEntity.name,
      ),
      body: GridView.builder(
        itemCount: cityEntity.services.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.1 / 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (_, i) => CityServicesGridViewItem(
            cityServicesEntity: cityEntity.services[i]),
      ),
    );
  }
}
