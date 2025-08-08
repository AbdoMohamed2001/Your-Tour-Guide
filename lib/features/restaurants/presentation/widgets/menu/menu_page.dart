import 'package:flutter/material.dart';
import 'menu_food_list_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
    required this.menu,
    required this.foodTypes,
    required this.foodIds,
  });

  final List<dynamic> menu;
  final List<String> foodTypes;
  final List<String> foodIds;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodTypes.length,
      itemBuilder: (_, i) => MenuItem(
        menu: menu,
        foodType: foodTypes[i],
        foodId: foodIds[i],
      ),
      separatorBuilder: (_, i) => SizedBox(height: 16),
    );
  }
}
