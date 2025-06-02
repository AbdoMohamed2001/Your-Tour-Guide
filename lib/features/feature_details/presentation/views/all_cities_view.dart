import 'package:flutter/material.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/features/feature_details/domain/city_entity.dart';
import 'package:your_tour_guide/features/feature_details/domain/city_services_entity.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';

class AllCitiesView extends StatelessWidget {
  const AllCitiesView({super.key, required this.city});

  final CityEntity city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isArabic() ? city.nameArabic : city.name,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7 / 1,
        ),
        itemCount: 8,
        itemBuilder: (_, i) => Stack(
          children: [
            DefaultCachedNetworkImage(
              imageUrl:
                  CityServicesEntity.getCityServices(city, context)[i].image,
              imageHeight: 300,
            ),
            // Image.network(
            //   CityServicesEntity.getCityServices(city, context)[i].image,
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: 300,
            // ),
            Positioned(
              bottom: 5,
              right: 10,
              child: Text(
                CityServicesEntity.getCityServices(city, context)[i].title,
                style: TextStyles.bold24.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
