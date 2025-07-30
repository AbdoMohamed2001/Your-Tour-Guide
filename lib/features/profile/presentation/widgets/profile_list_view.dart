import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/profile/presentation/widgets/profile_list_view_items.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    super.key,
    required this.list,
    this.containsArrowIcon = true,
  });
//
  final List list;
  final bool containsArrowIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (context, index) => SizedBox(),
      itemBuilder: (context, index) {
        return containsArrowIcon
            ? ProfileListItemWithArrowIcon(
                image: list[index].icon,
                text: list[index].text,
                pageName: list[index].nextPageName,
              )
            : ProfileListItemWithoutArrowIcon(
                image: list[index].icon,
                text: list[index].text,
              );
      },
    );
  }
}
