import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
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
    List<List<String>> foodTypesArabic = [
      [
        'الأطباق الرئيسية',
        'طيور مشوية',
        'مشاوي',
        'شوربة',
        'محاشي',
      ],
      ['Coffee', 'Soft drink', 'Juice'],
    ];
    List<List<String>> foodIds = [
      [
        'mainDishes',
        'poultryGrills',
        'grills',
        'soup',
        'mahashi',
      ],
      ['coffee', 'softDrink', 'juice'],
    ];
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      physics: NeverScrollableScrollPhysics(),
      //PAGES
      itemBuilder: (_, i) => MenuPage(
        menu: menu[i],
        foodTypes: isArabic() ? foodTypesArabic[i] : foodTypes[i],
        foodIds: foodIds[i],
      ),
      itemCount: 2,
    );
  }
}
