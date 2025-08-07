import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/features/cities/domain/entities/city_entity.dart';
import 'package:your_tour_guide/features/cities/presentation/widgets/city_view/city_view_body.dart';

class CityView extends StatelessWidget {
  CityView({
    Key? key,
    required this.cityEntity,
  }) : super(key: key);
  final CityEntity cityEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isArabic() ? cityEntity.nameArabic : cityEntity.name,
        leading: CustomAppBarIconButton(),
      ),
      body: CityViewBody(cityEntity: cityEntity),
    );
  }
}
