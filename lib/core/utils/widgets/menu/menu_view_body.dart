import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import '../../../../features/restaurants/presentation/widgets/menu/menu_page_view.dart';
import '../../../../features/restaurants/presentation/widgets/menu/menu_types_item.dart';
import '../../../../generated/l10n.dart';

class MenuViewBody extends StatefulWidget {
  const MenuViewBody({super.key});

  @override
  State<MenuViewBody> createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  late final PageController pageController;
  int currentPageIndex = 0; // Use int instead of bool - 0 for Food, 1 for Drink
  bool isSelected = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuTypesItem(
                onTap: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                  pageController.animateToPage(
                    currentPageIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                type: S.of(context).foods,
                isSelected: currentPageIndex == 0,
              ),
              MenuTypesItem(
                onTap: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                  pageController.animateToPage(
                    currentPageIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                type: S.of(context).drinks,
                isSelected: currentPageIndex == 1,
              ),
            ],
          ),
          kSizedBox,
          Expanded(
            flex: 2,
            child: MenuPageView(
              pageController: pageController,
              onPageChanged: (index) {
                // Update the current page when PageView changes
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

//EXAMPLE : BREAKFAST - LUNCH - DINNER - SNACKS - DESSERTS
// class FoodTypesList extends StatelessWidget {
//   const FoodTypesList({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (_, index) => MenuTypesItem(
//         type: foodTypes[index],
//         width: 110,
//       ),
//       separatorBuilder: (_, i) => SizedBox(width: 5),
//       itemCount: foodTypes.length,
//     );
//   }
// }
