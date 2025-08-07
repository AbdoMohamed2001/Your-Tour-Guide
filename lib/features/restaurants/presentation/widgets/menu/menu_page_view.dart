import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/drink_entity.dart';

import '../../../domain/entities/food_entity.dart';
import 'menu_page.dart';

class MenuPageView extends StatelessWidget {
  const MenuPageView({
    super.key,
    required this.pageController,
    this.onPageChanged,
  });
  final PageController pageController;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    List<dynamic> menu = [
      getDummyFoods(),
      getDummyDrinks(),
    ];
    List<List<String>> foodTypes = [
      [
        'Main Dishes',
        'Poultry Grills',
        'Grills',
        'Soup',
        'Mahashi',
      ],
      ['Coffee', 'Soft drink', 'Juice'],
    ];
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      physics: NeverScrollableScrollPhysics(),
      //PAGES
      itemBuilder: (_, i) => MenuPage(
        menu: menu[i],
        foodTypes: foodTypes[i],
      ),
      itemCount: 2,
    );
  }
}
