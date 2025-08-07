import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/text_styles.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.menu,
    required this.foodType,
  });

  final List<dynamic> menu;
  final String foodType;
  @override
  Widget build(BuildContext context) {
    var breakfastFoods = menu.where((item) => item.type == foodType).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodType,
          style: TextStyles.bold18,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => FoodContainer(food: breakfastFoods[i]),
            separatorBuilder: (_, i) => SizedBox(width: 5),
            itemCount: breakfastFoods.length,
          ),
        ),
      ],
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({
    super.key,
    required this.food,
  });

  final dynamic food;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 270,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      food.name,
                      style: TextStyles.semiBold18,
                    ),
                    Text(
                      "${food.price.toString()} EGP",
                      style: TextStyles.regular18,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl: food.imageUrl,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Text('There is an error'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
