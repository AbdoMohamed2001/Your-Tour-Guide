import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';

import '../../../services/get_it_services_locator.dart';

class LocalHeroAppBar extends StatefulWidget implements PreferredSizeWidget {
  const LocalHeroAppBar({super.key, required this.tabController, this.title});

  final TabController tabController;
  final String? title;

  @override
  State<LocalHeroAppBar> createState() => _LocalHeroAppBarState();

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}

class _LocalHeroAppBarState extends State<LocalHeroAppBar> {
  int tapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title == null
          ? SizedBox()
          : Text(widget.title!, style: TextStyles.bold18),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: _buildViewToggleButton(context),
        ),
      ],
    );
  }

  Widget _buildViewToggleButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size(30, 30)),
      child: RawMaterialButton(
        onPressed: () {
          setState(() {
            tapIndex = widget.tabController.index == 1 ? 0 : 1;
            widget.tabController.animateTo(tapIndex);
          });
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: getIt<HomeCubit>().isDarkMode
                ? Color(0xFF333333)
                : Color(0xFFE0E0E0),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        fillColor: Theme.of(context).cardColor,
        child: Icon(
          tapIndex == 1 ? Icons.grid_view_rounded : Icons.view_agenda_outlined,
          size: 16,
          color: context.read<HomeCubit>().isDarkMode
              ? Color(0xFFEEEEEE)
              : Color(0xFF333333),
        ),
      ),
    );
  }
}
