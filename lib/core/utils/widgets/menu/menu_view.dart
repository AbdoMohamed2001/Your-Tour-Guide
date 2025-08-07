import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/core/utils/widgets/menu/menu_view_body.dart';

import '../../../../generated/l10n.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).FullMenu,
        leading: CustomAppBarIconButton(),
      ),
      body: MenuViewBody(),
    );
  }
}
